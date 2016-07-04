//
//  DataService.swift
//  My-Memories
//
//  Created by Jason Piao on 2016-06-30.
//  Copyright © 2016 Jason Piao. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    static let shared = DataService()
    
    let KEY_POST = "post"
    var loadedPosts = [Post]()
    
    func deletePost(num: Int) {
        loadedPosts.removeAtIndex(num)
        savePosts()
    }
    
    func savePosts() {
        let postData = NSKeyedArchiver.archivedDataWithRootObject(loadedPosts)
        NSUserDefaults.standardUserDefaults().setObject(postData, forKey: KEY_POST)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadPosts() {
        if let postData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POST) as? NSData {
            
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postData) as? [Post] {
                loadedPosts = postsArray
            }
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postLoaded", object: nil))
    }
    
    func saveImageAndCreatePath(image: UIImage) -> String {
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
    }
    
    func imageForPath(path: String) -> UIImage? {
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addPost(post: Post) {
        loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
    func documentsPathForFileName(name: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    }
    
}
