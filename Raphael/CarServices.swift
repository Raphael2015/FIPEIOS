//
//  CarServices.swift
//  Raphael
//
//  Created by Raphael Higashi Silva on 03/09/17.
//  Copyright © 2017 Raphael Higashi Silva. All rights reserved.
//

import Foundation
class CarServices{
    var carros = [Carro]()
    func getCar( marca:String, modelo:String, tipo:String, onCompletion:@escaping ([Carro]) -> ()) {
        DataSource().apiData(dataTypeApi: .Detalhe, marca: marca, modelo: modelo, tipo: tipo){ (list) in
            if let _ = list {
            for carroList in list! {
                let carro = Carro()
                for (key,value) in carroList {
                    if key == "id" {
                        let s = value as! String
                        carro.id = s
                    }
                    if key == "name" {
                        carro.name = value as! String
                    }
                    if key == "preco" {
                        carro.price = value as! String
                    }
                    if key == "marca" {
                        carro.brand = value as! String
                    }
                    if key == "ano_modelo" {
                        carro.year = value as! String
                    }
                    if key == "veiculo" {
                        carro.vehicle = value as! String
                    }
                    if key == "combustivel" {
                        carro.fuel = value as! String
                    }
                    if key == "fipe_codigo" {
                        carro.reference = value as! String
                    }
                }
                self.carros.append(carro)
            }
            onCompletion(self.carros)
            }
        }
    }
}
