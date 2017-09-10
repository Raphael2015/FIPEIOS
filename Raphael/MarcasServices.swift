//
//  MarcasServices.swift
//  Raphael
//
//  Created by Raphael Higashi Silva on 25/08/17.
//  Copyright © 2017 Raphael Higashi Silva. All rights reserved.
//

import UIKit
class MarcasServices{
    var marcas = [Marca]()
    func getMarcas(onCompletion:@escaping ([Marca]) -> ()) {
        DataSource().apiData(dataTypeApi: .Marca, marca: "", modelo: "", tipo: ""){ (list) in
            for marcaList in list!  {
                 let marca = Marca()
                for (key,value) in marcaList {
                    if key == "fipe_name" {
                        marca.name_brand = value as! String
                    }
                    if key == "id" {
                        marca.id_brand = value as! Int
                    }
                }
                self.marcas.append(marca)
            }
            onCompletion(self.marcas)
        }
    }
}
