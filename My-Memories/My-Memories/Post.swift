//
//  Post.swift
//  My-Memories
//
//  Created by Jason Piao on 2016-06-30.
//  Copyright © 2016 Jason Piao. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    
    private var _imgPath: String!
    private var _title: String!
    private var _postDescrip: String!
    
    var imgPath: String {
        return _imgPath
    }
    
    var title: String {
        return _title
    }
    
    var postDescrip: String {
        return _postDescrip
    }
    
    init(img: String, title: String, description: String) {
        self._imgPath = img
        self._title = title
        self._postDescrip = description
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imgPath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._postDescrip = aDecoder.decodeObjectForKey("description") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imgPath, forKey: "imagePath")
        aCoder.encodeObject(self._title, forKey: "title")
        aCoder.encodeObject(self._postDescrip, forKey: "description")
    }
    
}