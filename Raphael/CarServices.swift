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
        DataSource().apiData(marca: marca, modelo: modelo, tipo: tipo){ (list) in
            for carroList in list! {
                let carro = Carro()
                for (key,value) in carroList {
                    switch(key) {
                    case "id" :
                        carro.id_car = value as! String
                    case "name":
                        carro.name_car = value as! String
                    case "brand":
                        carro.name_brand = value as! String
                    case "year" :
                        carro.year_model = value as! String
                    case "vehicle" :
                        carro.vehicle_car = value as! String
                    case "fuel" :
                        carro.fuel_car = value as! String
                    case "reference" :
                        carro.reference_car = value as! String
                    case "fipe" :
                        carro.fipe_car = value as! String
                    default:
                        break
                    }
                    
                }
                self.carros.append(carro)
            }
            onCompletion(self.carros)
        }
    }
}
