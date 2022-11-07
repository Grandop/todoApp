//
//  ViewController.swift
//  to-doApp
//
//  Created by Pedro Grando on 05/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = false
        
        cell.textLabel?.text = tasksList[indexPath.row]

        return cell
    }
    
    @IBAction func buttonToAddTask(_ sender: UIButton) {
        let task = String(taskTextField.text!)
        
        tasksList.append(task)
        setStorageTasks()
        tableView.reloadData()
        
        taskTextField.text = ""
    }
    
    @IBAction func buttonToRemoveTask(_ sender: UIButton) {
        var superview = sender.superview
            while let view = superview, !(view is UITableViewCell) {
                superview = view.superview
            }
            guard let cell = superview as? UITableViewCell else {
                return
            }
            guard let indexPath = tableView.indexPath(for: cell) else {
                return
            }

        tasksList.remove(at: indexPath.row)
        tableView.reloadData()
        setStorageTasks()
    }

    func setStorageTasks() {
        UserDefaults.standard.set(tasksList, forKey: tasksListKey)
    }
    
}

