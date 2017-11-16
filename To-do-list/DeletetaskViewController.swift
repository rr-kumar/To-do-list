//
//  DeletetaskViewController.swift
//  To-do-list
//
//  Created by Apple on 15/11/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class DeletetaskViewController: UIViewController {
    
    @IBOutlet weak var viewtaskLabel: UILabel!
    var task = Task()
    var previousVC = ViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task.priority {
            
           viewtaskLabel.text = "🔴  \(task.taskname)"
            
        }else{
          viewtaskLabel.text = "🔵  \(task.taskname)"
            
        }
     
    }

    @IBAction func deletetaskButton(_ sender: Any) {
       previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
     
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
       
    }
    

   

}
