//
//  ImageStore.swift
//  RandomUser
//
//  Created by Ayuna NYC on 1/11/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit

struct ImageStore {
    
    let manager = FileManager.default
    
    private let documentsSubdirectoryName = "UserImages"
    static let jpgSuffix = ".jpg"
    
    
    func documentsDirectoryUrl() -> URL {
        
        let directoryPaths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectoryUrl = directoryPaths[0]
        
//        print(" \n \n \n  PATHS: \(paths) \n \n \n ")
//        print(" \n \n \n  documentsDirectory: \(documentsDirectory) \n \n \n ")
        
        return documentsDirectoryUrl
    }
    
    
    func userImagesDirectoryPath() -> String {
        let newDir = documentsDirectoryUrl().appendingPathComponent(documentsSubdirectoryName).path
        return newDir
    }
    
    
    func store(image: UIImage, for user: User) {

        let imageName = String(Int(user.id)) + ".jpg"
        
        let imagePathUrl = documentsDirectoryUrl().appendingPathComponent(imageName)
        
        let imageData = UIImageJPEGRepresentation(image, 0.7)!
        
        do {
            try imageData.write(to: imagePathUrl, options: .atomic)
        } catch {
            print(error)
        }
    }
    
    
    func retrieveLocalImageFor(user: User) -> UIImage? {
        
        let imageName = String(Int(user.id)) + ".jpg"
        
        let imagePath = documentsDirectoryUrl().appendingPathComponent(imageName).path
        
        print("\n RETRIEVING IMAGE FROM A LOCAL STORE \n")
        
        
        if manager.fileExists(atPath: imagePath) {
            
            print("File exists")
            
            let image = UIImage(contentsOfFile: imagePath)!
            print("\n SUCCESSFULLY RETRIEVED IMAGE FROM A LOCAL STORE \n")
        
            return image
        
        } else {
        
            print("File not found")
            print("\n COULD NOT RETRIEVE AN IMAGE FROM A LOCAL STORE \n")
            
            return nil
        }
    }

}
