//
//  ViewController.swift
//  AlamofireProj
//
//  Created by Matheus Pacheco Fusco on 06/03/17.
//  Copyright © 2017 Matheus Pacheco Fusco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let manager = APIManager()
        manager.get { (response) in
            if let resp = response as? ResponseModel {
                print("Manager response: \(resp)")
            }
            else {
                print("Manager error: \(response)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
