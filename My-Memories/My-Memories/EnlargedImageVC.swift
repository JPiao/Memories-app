//
//  EnlargedImageVC.swift
//  My-Memories
//
//  Created by Jason Piao on 2016-07-03.
//  Copyright © 2016 Jason Piao. All rights reserved.
//

import UIKit

class EnlargedImageVC: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    var passedImg: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = passedImg
    }
    
    @IBAction func backBtnPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
