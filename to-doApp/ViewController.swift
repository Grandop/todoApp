//
//  ViewController.swift
//  to-doApp
//
//  Created by Pedro Grando on 05/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var allTasks: [TaskList] = []
    let spacingBetweenSecions: CGFloat = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allTasks = addingTasks()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    func addingTasks() -> [TaskList] {
        return [
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa"),
            TaskList(taskNameStructed: "Limpar a casa")
            
        ]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TaskCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TaskCell
        
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true

        
        cell.addingTaskOnList(task: allTasks[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("apertado \(allTasks[indexPath.row])")
    }
    

}

