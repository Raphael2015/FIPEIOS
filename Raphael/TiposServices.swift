//
//  TiposServices.swift
//  Raphael
//
//  Created by Raphael Higashi Silva on 30/08/17.
//  Copyright © 2017 Raphael Higashi Silva. All rights reserved.
//

import UIKit
class TiposServices{
    var tipos = [Tipo]()
    func getTipos( marca:String, modelo:String, onCompletion:@escaping ([Tipo]) -> ()) {
        DataSource().apiData(marca: marca, modelo: modelo, tipo: ""){ (list) in
            for tipoList in list! {
                let tipo = Tipo()
                for (key,value) in tipoList {
                    switch(key) {
                    case "name":
                        tipo.name_type = value as! String
                    case "id" :
                        tipo.id_type = value as! String
                    case "fipe_codigo" :
                        tipo.code_type = value as! String
                    case "key" :
                        tipo.key_type = value as! String
                    case "veiculo" :
                        tipo.vehicle_type = value as! String
                    default:
                        break
                    }
                    
                }
                self.tipos.append(tipo)
            }
            onCompletion(self.tipos)
        }
    }
}
