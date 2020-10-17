//
//  CompleteViewController.swift
//  TodoList
//
//  Created by Toxumuharu on 2020/10/16.
//  Copyright © 2020 toxumuharu.com. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    var toDo: ToDo? = nil
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDo = toDo{
            if toDo.important{
                if let name = toDo.name{
                    nameLabel.text = "❗️" + name
                }
            }else{
                nameLabel.text = toDo.name
            }
        }
    }
    
    
    @IBAction func completeTapped(_ sender: Any) {
        // Delete ToDo
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let toDo = toDo{
                context.delete(toDo)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            }
        }
        // Pop back
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
