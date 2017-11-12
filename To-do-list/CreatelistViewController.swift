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
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        // Do any additional setup after loading the view.
    }

    @IBAction func AddButton(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
