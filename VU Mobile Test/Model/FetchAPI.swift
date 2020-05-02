//
//  FetchAPI.swift
//  VU Mobile Test
//
//  Created by MD RUBEL on 2/5/20.
//  Copyright © 2020 MD RUBEL. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct FetchAPI {
        
    func getData(completion: @escaping (_ avatars: [String]) -> Void) {
        
        AF.request("https://reqres.in/api/users?page=1")
            .validate()
            .responseJSON { (resp) in
                
                var urls: [String] = []

                if let data = resp.data {
                    do {
                        let json = try JSON(data: data)
                        let jsonData = json["data"].arrayValue
                        
                        for avatarItem in jsonData {
                            urls.append(avatarItem["avatar"].stringValue)
                        }
                        
                        completion(urls)
                        
                    } catch {
                        print(error.localizedDescription)
                        completion([])
                    }
                    
                } else if let err = resp.error {
                    print(err)
                    completion([])
                }
                
        }
    }
}
