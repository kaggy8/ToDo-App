//
//  TaskListViewController.swift
//  ToDo App
//
//  Created by Stanislav Demyanov on 09.10.2022.
//

import UIKit

class TaskListViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "ToDo List"
        
        let navBarAppearance =  UINavigationBarAppearance()
        
        navBarAppearance.backgroundColor = UIColor.orange
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}

