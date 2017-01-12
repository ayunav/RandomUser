//
//  ImageStore.swift
//  RandomUser
//
//  Created by Ayuna NYC on 1/11/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit

struct ImageStore {
    
    private let manager = FileManager.default
    
    private static let jpgSuffix = ".jpg"
    
    
    private func documentsDirectoryUrl() -> URL {
        
        let directoryPaths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectoryUrl = directoryPaths[0]
        
        return documentsDirectoryUrl
    }
    
    
    func store(image: UIImage, for user: User) {

        let imageName = String(Int(user.id)) + ImageStore.jpgSuffix
        
        let imagePathUrl = documentsDirectoryUrl().appendingPathComponent(imageName)
        
        let imageData = UIImageJPEGRepresentation(image, 0.7)!
        
        do {
            try imageData.write(to: imagePathUrl, options: .atomic)
        } catch {
            print(error)
        }
    }
    
    
    func retrieveLocalImageFor(user: User) -> UIImage? {
        
        let imageName = String(Int(user.id)) + ImageStore.jpgSuffix
        
        let imagePath = documentsDirectoryUrl().appendingPathComponent(imageName).path

        if manager.fileExists(atPath: imagePath) {
            
            let image = UIImage(contentsOfFile: imagePath)!
            
            return image
        
        } else {
        
            return nil
        }
    }

}
