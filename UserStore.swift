//
//  UserStore.swift
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


struct UserStore {
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    
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

        let isStored = isImageStoredLocally()
        
        if isStored == false {
            
            let result = requestImageFromUrl(url: user.thumbnailUrl)
        
            if case let .success(image) = result { // could be  if result = case let .Success(image) ?
                user.avatar = image
            }
            
            completion(result)
            
        }
    }

    
    func isImageStoredLocally() -> Bool {
        // check if image is available from a local file
        // retrieveImageFromFile() -> ImageResult
        // pass the image to cell
        // return true
        
        return false
    }

    
    func requestImageFromUrl(url: URL) -> ImageResult {

        let data = try! Data(contentsOf: url, options: [])
        
        var image = UIImage()
        
        if data.count > 0 {
            image = UIImage(data: data)!
            storeImageToFile(image: image)
            return .success(image)
        } else {
            image = UIImage(named: "placeholder.png")!
            return .failure()
        }
    }
    
    
    func storeImageToFile(image: UIImage) {
        let imageData = UIImageJPEGRepresentation(image, 1.0)
        let filename = getDocumentsDirectory().appendingPathComponent("photo.jpeg")
        try? imageData?.write(to: filename)
    }
 
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    
    
}
