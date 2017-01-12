//
//  ActivityIndicator.swift
//  RandomUser
//
//  Created by Ayuna NYC on 1/12/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit

class ActivityIndicator {
    
    static let sharedInstance = ActivityIndicator()
    
    private let activityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0.0, y: 0.0, width: 20, height: 20))

    func showActivityIndicatorInView(view: UIView) {
        activityIndicatorView.center = view.center
        view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
    }
    
    
    func hideActivityIndicator() {
        activityIndicatorView.stopAnimating()
        activityIndicatorView.removeFromSuperview()
    }
    
}
