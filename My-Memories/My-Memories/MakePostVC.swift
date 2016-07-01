//
//  MakePostVC.swift
//  My-Memories
//
//  Created by Jason Piao on 2016-06-30.
//  Copyright © 2016 Jason Piao. All rights reserved.
//

import UIKit

class MakePostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var postDescrip: UITextField!
    
    var imgPicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImg.layer.cornerRadius = 30
        postImg.clipsToBounds = true
        
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
    }

    @IBAction func CancelBtnPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addPhotoBtnPress(sender: UIButton!) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imgPicker, animated: true, completion: nil)
    }
    
    @IBAction func makePostBtnPress(sender: AnyObject) {
        if let title = postTitle.text, let descrip = postDescrip.text, let img = postImg.image {
            let post = Post(img: "", title: title, description: descrip)
            DataService.shared.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imgPicker.dismissViewControllerAnimated(true, completion: nil)
        postImg.image = image
    }
    
}
