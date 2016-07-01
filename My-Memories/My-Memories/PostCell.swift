//
//  PostCell.swift
//  My-Memories
//
//  Created by Jason Piao on 2016-06-30.
//  Copyright © 2016 Jason Piao. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var postDescrip: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = 30
        img.clipsToBounds = true
    }

    func configureCell(post: Post) {
        title.text = post.title
        postDescrip.text = post.postDescrip
    }
}
