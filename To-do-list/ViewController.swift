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
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
     
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
    pullTasks()
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let showTask = tasks[indexPath.row]
        if showTask.priority {
            
            cell.textLabel?.text = "🔴  \(showTask.taskname!)"
            
        }else{
            cell.textLabel?.text = "🔵  \(String(describing: showTask.taskname))"
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "deletetaskSegue", sender: task)
    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
        }
    
    func pullTasks(){
        
        let showcontext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
           tasks = try showcontext.fetch(Task.fetchRequest()) as! [Task]
           
        }catch{
            
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addsegue"{
            _ = segue.destination as! CreatelistViewController
    
        }
        
        if segue.identifier == "deletetaskSegue"{
            let nextVC = segue.destination as! DeletetaskViewController
            nextVC.task = sender as? Task
            
            
        }
    }
}

