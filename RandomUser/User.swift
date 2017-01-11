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


class User {
    
    var avatar      : UIImage?
    let id          : Int
    let name        : String
    let thumbnailUrl: URL
    

    init(id: Int, name: String, thumbnailUrl: URL) {
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

        return User(id: id, name: name, thumbnailUrl: url)
    }
}
