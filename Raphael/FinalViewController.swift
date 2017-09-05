//
//  FinalViewController.swift
//  Raphael
//
//  Created by Raphael Higashi Silva on 03/09/17.
//  Copyright © 2017 Raphael Higashi Silva. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    var carro:Carro!
    
    var marca:Marca!
    var modelo:Modelo!
    var tipo:Tipo!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMarca: UILabel!
    @IBOutlet weak var lblAno: UILabel!
    @IBOutlet weak var lblVeiculo: UILabel!
    @IBOutlet weak var lblCombustivel: UILabel!
    @IBOutlet weak var lblPreco: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        iniCommon()
        self.title = tipo.name_type
    }
    func iniCommon(){
        self.lblName.text = "Nome: \(carro.name_car!)"
        self.lblMarca.text = "Marca: \(marca.name_brand!)"
        self.lblCombustivel.text = "Marca: \(carro.fuel_car!)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}
