//
//  User.swift
//  RandomUser
//
//  Created by Ayuna NYC on 1/9/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit

struct User {
    
    let avatar: UIImage
    let name: String

    init(avatar: UIImage, name: String) {
        self.avatar = avatar
        self.name = name
    }
}
