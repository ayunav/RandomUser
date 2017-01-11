//
//  DataManager.swift
//  RandomUser
//
//  Created by Ayuna NYC on 1/9/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit


enum UsersResult {
    case success([User])
    case failure()
//    case failure(Error)
}

enum ImageResult {
    case success(UIImage)
    case failure()
}


struct DataManager {
    
    let store = ImageStore()
    
    
    func getUsers(completion: @escaping (UsersResult) -> Void) {
        
        let file = Bundle.main.path(forResource: "randomUsers", ofType: "json")
        let url  = URL(fileURLWithPath: file!)
        let data = try! Data(contentsOf: url, options: [])
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        
        let dictArray = json["users"] as! [[String : Any]]
        let users = dictArray.flatMap(User.userFromJsonDict)
        
        if users.count > 0 {
            completion(UsersResult.success(users))
        } else {
            completion(UsersResult.failure())
        }
    }
    
    
    func getImageForUser(user: User, completion: (ImageResult) -> Void) {

        let image = store.retrieveLocalImageFor(user: user)
        
        if image != nil {
            user.avatar = image
            completion(.success(image!))
        } else {
            let image = self.requestImageFromUrlFor(user: user)
            
            if image != nil {
                user.avatar = image
                completion(.success(image!))
            } else {
                completion(.failure())
            }
        }
    }

    
    
    func requestImageFromUrlFor(user: User) -> UIImage? {

        let data = try! Data(contentsOf: user.thumbnailUrl, options: [])
        
        var image = UIImage()
        
        if data.count > 0 {
            
            image = UIImage(data: data)! // add guards here 
            
            self.store.store(image: image, for: user)
            
            return image
        
        } else {
            //image = UIImage(named: "placeholder.png")! //? not being used , should be used ?
            return nil
        }
    }
    
}
