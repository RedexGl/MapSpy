//
//  ViewController.swift
//  MapSpy
//
//  Created by Igor Shevchenko on 1/11/18.
//  Copyright © 2018 Igor Shevchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        let viewcontroller = LoginViewController()
        
        self.navigationController?.pushViewController(viewcontroller, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

