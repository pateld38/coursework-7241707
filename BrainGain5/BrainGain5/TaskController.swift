//
//  TaskController.swift
//  BrainGain5
//
//  Created by Dhruv Patel on 13/12/2018.
//  Copyright © 2018 Dhruv Patel. All rights reserved.
//

import UIKit

class TaskController: UITableViewController {
    
    var items:[String] = []

    @IBAction func editM(_ sender: UIBarButtonItem) {
        self.isEditing = !self.isEditing
        print("editmode: \(self.isEditing)")
        if self.isEditing {
            sender.title = "Done"
        } else {
            sender.title = "Edit"
        }
        
    }
    @IBAction func Add(_ sender: UIBarButtonItem) {
        print("Add")
        let alert = UIAlertController(title: "New Task", message: "Enter Task Below", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Add", style: .default,handler: { action in
            if let textFields = alert.textFields {
                if let item = textFields[0].text {
                    print(item)
                    self.items.append(item)
                    print(self.items)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        

        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskItem", for: indexPath)
        if let label = cell.textLabel {
            label.text = self.items[indexPath.row]
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        }
        else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
}
    
}

