//
//  CreatelistViewController.swift
//  To-do-list
//
//  Created by Apple on 12/11/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class CreatelistViewController: UIViewController {
    @IBOutlet weak var prioritySwitch: UISwitch!
    
    @IBOutlet weak var createtaskTextField: UITextField!
    
    var previousVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        // Do any additional setup after loading the view.
    }

    @IBAction func AddButton(_ sender: Any) {
        // create new task from createviewController outlet
        
        let newTask = Task()
        newTask.taskname = createtaskTextField.text!
        newTask.priority = prioritySwitch.isOn
        
        // Add New task array for previousViewController
        
        previousVC.tasks.append(newTask)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
   
}
