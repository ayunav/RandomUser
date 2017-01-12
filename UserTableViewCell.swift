//
//  UserTableViewCell.swift
//  RandomUser
//
//  Created by Ayuna NYC on 1/9/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadii()
    }
    
    
    func updateCornerRadii() {
        let radius = self.avatarView.frame.size.width / 2.0
        self.avatarView.layer.cornerRadius = radius
        avatarView.clipsToBounds = true
    }

    
    func updateWithImage(image: UIImage) {
        
        avatarView.alpha = 0
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: UIViewAnimationOptions.showHideTransitionViews,
                       animations: { () -> Void in
                        
                          self.avatarView.image = image
                          self.avatarView.alpha = 1
                        
                       }, completion: { (Bool) -> Void in
        })
    }
    
}
