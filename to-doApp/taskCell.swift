//
//  taskCell.swift
//  to-doApp
//
//  Created by Pedro Grando on 05/11/22.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var trashTask: UIImageView!
    @IBOutlet weak var taskName: UILabel!
    
    
    func addingTaskOnList(task: TaskList) {
        taskName.text = task.taskNameStructed
    }
}
