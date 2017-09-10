//
//  ModelosServices.swift
//  Raphael
//
//  Created by Raphael Higashi Silva on 25/08/17.
//  Copyright © 2017 Raphael Higashi Silva. All rights reserved.
//

import UIKit
class ModelosServices{
    var modelos = [Modelo]()
    func getModelos( marca:String, onCompletion:@escaping ([Modelo]) -> ()) {
        DataSource().apiData(dataTypeApi: .Modelo, marca: marca, modelo: "", tipo: ""){ (list) in
            for modeloList in list! {
                let modelo = Modelo()
                for (key,value) in modeloList {
                    switch(key) {
                    case "name" :
                        modelo.name_model = value as! String
                    case "id" :
                        let s = value as! String
                        modelo.id_model = s
                    default:
                        break
                    }
                }
                self.modelos.append(modelo)
            }
            onCompletion(self.modelos)
        }
    }
}
