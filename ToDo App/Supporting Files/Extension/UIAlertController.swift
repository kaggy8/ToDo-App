//
//  UIAlertController.swift
//  ToDo App
//
//  Created by Stanislav Demyanov on 15.10.2022.
//

import UIKit

extension UIAlertController {
    static func createAlertController(withTitle title: String) -> UIAlertController {
        UIAlertController(title: title,
                          message: "Что вы хотите сделать",
                          preferredStyle: .alert)
    }
    func action(task: Task?, completion: @escaping (String) -> Void) {
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { _ in
            guard let newValue = self.textFields?.first?.text else { return }
            guard !newValue.isEmpty else { return }
            completion(newValue)
        }
        
        let cancelAction = UIAlertAction(title: "Отмена",
                                         style: .destructive)
        
        addAction(saveAction)
        addAction(cancelAction)
        addTextField{ textField in
            textField.placeholder = "Задача"
            textField.text = task?.title
        }
    }
}

