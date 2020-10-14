//
//  CreateTodoViewController.swift
//  TodoList
//
//  Created by Toxumuharu on 2020/10/15.
//  Copyright © 2020 toxumuharu.com. All rights reserved.
//

import UIKit

class CreateTodoViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    var toDoTableVC: ToDoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let newTodo = ToDo()
        
        if let name = nameTextField.text{
            newTodo.name = name
        }
        newTodo.important = importantSwitch.isOn
        
        toDoTableVC?.toDos.append(newTodo)
        toDoTableVC?.tableView.reloadData()
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
