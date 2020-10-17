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
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    func getToDos(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let toDosFromCoreData = try? context.fetch(ToDo.fetchRequest()){
                if let toDos = toDosFromCoreData as? [ToDo]{
                    self.toDos = toDos
                    tableView.reloadData()
                }
            }
        }
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
            if let name = currentToDo.name{
                cell.textLabel?.text = "❗️" + name
            }
        }else{
            // Normal
            if let name = currentToDo.name{
                cell.textLabel?.text = name
            }
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let createVC = segue.destination as? CreateTodoViewController{
            createVC.toDoTableVC = self
        }
        
        if let completeVC = segue.destination as? CompleteViewController{
            if let selectTodo = sender as? ToDo{
                completeVC.toDo = selectTodo
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTodo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: selectedTodo)
    }
    
}
