//
//  ViewController.swift
//  AlertBarController
//
//  Created by Ary on 23/12/2020.
//  Copyright © 2020 Ary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func showInfo(_ sender: Any) {
        
        let alert = AlertBarController(message: "This is an Info alert")
        present(alert, animated: true)
    }
    
    @IBAction func showSuccess(_ sender: Any) {
        
        let alert = AlertBarController(message: "This is a Success alert", alertType: .success)
        present(alert, animated: true)
    }
    
    @IBAction func showWarning(_ sender: Any) {
        
        let alert = AlertBarController(message: "This is a Warning alert", alertType: .warning)
        present(alert, animated: true)
    }
    
    @IBAction func showError(_ sender: Any) {
        
        let alert = AlertBarController(message: "This is an Error alert", alertType: .error, style:.normal)
        present(alert, animated: true)
    }
    
    @IBAction func showDark(_ sender: Any) {
        
        let alert = AlertBarController(message: "This is a Dark alert")
        alert.alertType = [.error, .info, .warning, .success].randomElement()!
        alert.style = .dark
        present(alert, animated: true)
    }
    
}

