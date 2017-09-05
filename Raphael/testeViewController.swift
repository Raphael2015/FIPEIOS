//
//  testeViewController.swift
//  Raphael
//
//  Created by Raphael Higashi Silva on 27/08/17.
//  Copyright © 2017 Raphael Higashi Silva. All rights reserved.
//

import UIKit
class testeViewController: UIViewController {
    
    @IBOutlet weak var lblMarca: UILabel!
    var mark: Marca!// captura parametro
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        lblMarca.text = String(mark.id_brand)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
