//
//  MarcaDataSource.swift
//  Raphael
//
//  Created by Raphael Higashi Silva on 25/08/17.
//  Copyright © 2017 Raphael Higashi Silva. All rights reserved.
//

import Foundation
class DataSource{
    
    var basePath: String = ""

    let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-Type":"application/json"]
        config.timeoutIntervalForRequest = 45.0
        config.httpMaximumConnectionsPerHost = 5
        
        return config
    }()
    
    
    func apiData(marca: String, modelo: String, tipo: String, onCompletion: @escaping ([[String:Any]]?) -> Void){
        if(marca == ""){
            basePath = "https://fipeapi.appspot.com/api/1/carros/marcas.json"
        }else if(modelo == ""){
            basePath = "https://fipeapi.appspot.com/api/1/carros/veiculos/\(marca).json"
        }else if(modelo != "" && marca != ""){
            basePath = "https://fipeapi.appspot.com/api/1/carros/veiculo/\(marca)/\(modelo).json"
        }else if(modelo != "" && marca != "" && tipo != ""){
            basePath = "https://fipeapi.appspot.com/api/1/carros/veiculo/\(tipo)/\(marca)/\(modelo).json"
        }

        let session = URLSession(configuration: configuration)
        
        guard let url = URL(string: basePath) else {
            onCompletion(nil)
            return
        }
        
        session.dataTask(with: url) {(data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                onCompletion(nil)
            } else {
                guard let response = response as? HTTPURLResponse else {
                    onCompletion(nil)
                    return
                }
                
                if response.statusCode == 200 {
                    guard let data = data else {
                        onCompletion(nil)
                        return
                    }
                    
                    let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
                    
                    onCompletion(json)
                    
                }
            }
            }.resume()
    }

}
