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
        self.title = tipo.name_type
        loadCarros()
    }
    func loadCarros(){
        CarServices().getCar(marca: String(marca.id_brand), modelo: modelo.id_model, tipo: tipo.id_type){
            self.carro = $0.first
            DispatchQueue.main.async {
                self.iniCommon()
            }
        }
    }
    func iniCommon(){
        if let name = self.carro.name {
            self.lblName.text = "Nome: \(name)"
        }
        if let name_brand = self.marca.name_brand {
            self.lblMarca.text = "Marca: \(name_brand)"
        }
        if let carro_year = self.carro.year {
            self.lblAno.text = "Ano: \(carro_year)"
        }
        if let carro_vehicle = self.carro.vehicle {
            self.lblVeiculo.text = "Vaiculo: \(carro_vehicle)"
        }
        if let carro_fuel = self.carro.fuel {
            self.lblCombustivel.text = "Combustivel: \(carro_fuel)"
        }
        if let carro_price = self.carro.price {
            self.lblPreco.text = "Preço: \(carro_price)"
        }
    }
}
