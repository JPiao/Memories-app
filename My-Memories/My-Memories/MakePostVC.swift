//
//  MakePostVC.swift
//  My-Memories
//
//  Created by Jason Piao on 2016-06-30.
//  Copyright © 2016 Jason Piao. All rights reserved.
//

import UIKit

class MakePostVC: UIViewController {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var postDescrip: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImg.layer.cornerRadius = 30
        postImg.clipsToBounds = true
    }

    @IBAction func CancelBtnPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addPhotoBtnPress(sender: UIButton!) {
        sender.setTitle("", forState: .Normal)
    }
    
    @IBAction func makePostBtnPress(sender: AnyObject) {
    }
    
}
