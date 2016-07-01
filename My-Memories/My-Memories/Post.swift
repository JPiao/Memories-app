//
//  Post.swift
//  My-Memories
//
//  Created by Jason Piao on 2016-06-30.
//  Copyright © 2016 Jason Piao. All rights reserved.
//

import Foundation

class Post {
    
    private var _imgPath: String
    private var _title: String
    private var _postDescrip: String
    
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
    
}