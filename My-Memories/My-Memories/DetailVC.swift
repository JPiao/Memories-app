//
//  DetailVC.swift
//  My-Memories
//
//  Created by Jason Piao on 2016-07-02.
//  Copyright © 2016 Jason Piao. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var descripLable: UILabel!
    
    var titleText = ""
    var image: UIImage!
    var descText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.layer.cornerRadius = 15.0
        img.clipsToBounds = true
    }
    
    override func viewWillAppear(animated: Bool) {
        titleLable.text = titleText
        descripLable.text = descText
        img.image = image
    }
    
    @IBAction func backBtnPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}