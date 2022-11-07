//
//  TaskCell.swift
//  to-doApp
//
//  Created by Pedro Grando on 07/11/22.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var taskName: UILabel!
    
    var upadateDelegate: UptadeCells?
    
    @IBAction func btnToRemove(_ sender: UIButton) {
        upadateDelegate?.didPressTrash(cell: self)
    }
    
}
