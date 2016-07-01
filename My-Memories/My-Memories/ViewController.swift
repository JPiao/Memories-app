//
//  ViewController.swift
//  My-Memories
//
//  Created by Jason Piao on 2016-06-30.
//  Copyright © 2016 Jason Piao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.onPostLoaded(_:)), name: "postLoaded", object: nil)
        
        DataService.shared.loadPosts()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.shared.loadedPosts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = DataService.shared.loadedPosts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            cell.configureCell(post)
            return cell
            
        } else {
            let cell = PostCell()
            cell.configureCell(post)
            return cell
        }
    
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 101.0
    }
    
    func onPostLoaded(notif: AnyObject) {
        tableView.reloadData()
    }
    
}

