//
//  GalleryVC.swift
//  VU Mobile Test
//
//  Created by MD RUBEL on 2/5/20.
//  Copyright © 2020 MD RUBEL. All rights reserved.
//

import UIKit

class GalleryVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let spinner = UIActivityIndicatorView()
    private let api = FetchAPI()
    private var avatars: [String] = []
    
    private var estimateWidth: CGFloat = 125.0
    private var cellMarginSize: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        api.getData { (urls) in
            if urls.isEmpty {
                print("NOT FOUND")
                
            } else {
                self.avatars = urls
                self.collectionView.reloadData()
                self.spinner.stopAnimating()
                for subview in self.collectionView.subviews {
                    if subview.tag == 21213 {
                        subview.removeFromSuperview()
                    }
                }
            }
        }
    }
    
    private func setupUI() {
        
        // Collection View Setup
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
        collectionView.reloadData()
        
        // Grid Layout Setup
        let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = cellMarginSize
        flow.minimumLineSpacing = cellMarginSize
        
        // Loading Spinner Setup
        spinner.style = .whiteLarge
        spinner.color = .black
        spinner.hidesWhenStopped = true
        spinner.tag = 21213
        spinner.center = CGPoint(x: collectionView.frame.width / 2, y: collectionView.frame.height / 2)
        collectionView.addSubview(spinner)
        spinner.startAnimating()
    }
    
    
    
}

extension GalleryVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avatars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.imageView.imageURL = avatars[indexPath.row]
        
        return cell
    }
}

extension GalleryVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = calculateWidth()
        return CGSize(width: width, height: width)
    }
    
    func calculateWidth() -> CGFloat {
        let estimatedWidth = estimateWidth
        let cellCount = floor(self.view.frame.size.width / estimatedWidth)
        
        let margin = cellMarginSize * 2
        let width = (self.view.frame.size.width - cellMarginSize * (cellCount - 1) - margin) / cellCount
        
        return width
    }
}
