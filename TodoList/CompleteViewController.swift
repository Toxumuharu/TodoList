//
//  CompleteViewController.swift
//  TodoList
//
//  Created by Toxumuharu on 2020/10/16.
//  Copyright © 2020 toxumuharu.com. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {

    var todo = ToDo()
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = todo.name
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
   

}
