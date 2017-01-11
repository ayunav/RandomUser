//
//  User.swift
//  RandomUser
//
//  Created by Ayuna NYC on 1/9/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit


enum UserFields: String
{
    case id        = "id"
    case name      = "name"
    case thumbnail = "thumbnail"
}


struct User {
    
    var avatar      : UIImage // make optional 
    let id          : Int
    let name        : String
    let thumbnailUrl: URL
    

    init(avatar: UIImage, id: Int, name: String, thumbnailUrl: URL) {
        self.avatar = avatar
        self.id = id
        self.name = name
        self.thumbnailUrl = thumbnailUrl
    }
    
    
    static func userFromJsonDict(json: [String: Any]) -> User?
    {
        guard let id = json[UserFields.id.rawValue] as? Int,
            let name = json[UserFields.name.rawValue] as? String,
            let thumbnailUrlString = json[UserFields.thumbnail.rawValue] as? String,
            let url = URL(string: thumbnailUrlString)
        else { return nil }

        let data = try! Data(contentsOf: url, options: [])
        
        var image = UIImage()
        
        if data.count > 0 {
            image = UIImage(data: data)!
        } else {
            image = UIImage(named: "placeholder.png")!
        }

        return User(avatar: image, id: id, name: name, thumbnailUrl: url)
    }
}
