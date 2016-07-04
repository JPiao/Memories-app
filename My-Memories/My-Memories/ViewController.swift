//
//  ViewController.swift
//  My-Memories
//
//  Created by Jason Piao on 2016-06-30.
//  Copyright © 2016 Jason Piao. All rights reserved.
//

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
    }
    
    override func viewWillAppear(animated: Bool) {
        
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //sending all the data in an array of strings as the sender so prepareForSeque and configure the data
        let title = DataService.shared.loadedPosts[indexPath.row].title
        let desc = DataService.shared.loadedPosts[indexPath.row].postDescrip
        let imgPath = DataService.shared.loadedPosts[indexPath.row].imgPath
        let array = [title, desc, imgPath]
        performSegueWithIdentifier("ShowDetail", sender: array)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //sending data from selected table cell to the DetailVC
        if segue.identifier == "ShowDetail" {
            if let svc = segue.destinationViewController as? DetailVC {
                if let info = sender as? [String] {
                    svc.titleText = info[0]
                    svc.descText = info[1]
                    svc.image = DataService.shared.imageForPath(info[2])
                }
            }
        }
    }
    
    func onPostLoaded(notif: AnyObject) {
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            DataService.shared.deletePost(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic) //can also call tableView.reload, but doing so would not animate the deletion
        }
    }
    
}
