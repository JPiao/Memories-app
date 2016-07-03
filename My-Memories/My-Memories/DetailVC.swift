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
    var image: UIImageView!
    var descText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        titleLable.text = titleText
        descripLable.text = descText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
