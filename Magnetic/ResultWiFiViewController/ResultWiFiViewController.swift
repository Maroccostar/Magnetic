//
//  ResultWiFiViewController.swift
//  Magnetic
//
//  Created by Vasiliy Homenko on 12.04.2024.
//

import UIKit

class ResultWiFiViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(resource: .colorBackground)
        title = "Result WiFi"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}

private extension ResultWiFiViewController {
    
}
