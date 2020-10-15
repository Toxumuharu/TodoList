//
//  ToDoTableViewController.swift
//  TodoList
//
//  Created by Toxumuharu on 2020/10/15.
//  Copyright © 2020 toxumuharu.com. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let toDo1 = ToDo()
        toDo1.name = "Walk the dog"
        toDo1.important = false

        let toDo2 = ToDo()
        toDo2.name = "Buy milk"
        toDo2.important = true
        
        toDos = [toDo1, toDo2]
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
            
        let currentToDo = toDos[indexPath.row]
        if currentToDo.important{
            // !
            cell.textLabel?.text = "❗️" + currentToDo.name
        }else{
            // Normal
            cell.textLabel?.text = "　" + currentToDo.name
        }

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let createVC = segue.destination as? CreateTodoViewController{
            createVC.toDoTableVC = self
        }
        
        if let completeVC = segue.destination as? CompleteViewController{
            if let selectTodo = sender as? ToDo{
                completeVC.todo = selectTodo
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTodo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: selectedTodo)
    }

}
