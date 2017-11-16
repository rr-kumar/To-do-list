//
//  ViewController.swift
//  To-do-list
//
//  Created by Apple on 11/11/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks:[Task] = []
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = addTask()
        tableView.dataSource = self
        tableView.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let showTask = tasks[indexPath.row]
        if showTask.priority {
            
            cell.textLabel?.text = "🔴  \(showTask.taskname)"
            
        }else{
            cell.textLabel?.text = "🔵  \(showTask.taskname)"
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "deletetaskSegue", sender: task)
    }
    
    func addTask() -> [Task] {
        let task1 = Task()
        task1.taskname = "Complete Swift tutorial"
        task1.priority = true
        
        let task2 = Task()
        task2.taskname = "Time to learn"
        task2.priority = false
        
        let task3 = Task()
        task3.taskname = "Apply creative Job"
        task3.priority = true
        
        return[task1,task2,task3]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addsegue"{
        let nextVC = segue.destination as! CreatelistViewController
        nextVC.previousVC = self
        }
        
        if segue.identifier == "deletetaskSegue"{
            let nextVC = segue.destination as! DeletetaskViewController
            nextVC.task = sender as! Task
              nextVC.previousVC = self
            
        }
    }
}

