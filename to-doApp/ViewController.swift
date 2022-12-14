//
//  ViewController.swift
//  to-doApp
//
//  Created by Pedro Grando on 05/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UptadeCells {

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var tasksList: [String] = []
    let tasksListKey = "tasksListKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasksList = UserDefaults.standard.stringArray(forKey: tasksListKey) ?? []
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TaskCell
       
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = false
        cell.upadateDelegate = self
        cell.taskName.text = tasksList[indexPath.row]

        return cell
    }
    
    @IBAction func buttonToAddTask(_ sender: UIButton) {
        let task = String(taskTextField.text!)
        
        tasksList.append(task)
        setStorageTasks()
        tableView.reloadData()
        
        taskTextField.text = ""
    }

    func setStorageTasks() {
        UserDefaults.standard.set(tasksList, forKey: tasksListKey)
    }
    
    func didPressTrash(cell: UITableViewCell) {
        
        let excludeRowAlert = UIAlertController(title: "Remover nota", message: "Você tem certeza que deseja remover a tarefa? ", preferredStyle: .alert)
        
        excludeRowAlert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        excludeRowAlert.addAction(UIAlertAction(title: "Remover", style: .destructive) { _ in
            
            let indexPath = self.tableView.indexPath(for: cell)
            
            self.tasksList.remove(at: indexPath?.row ?? 0)
            self.tableView.reloadData()
            self.setStorageTasks()
        })
        
        self.present(excludeRowAlert, animated: true)
    }
    
}

