//
//  MarcaDataSource.swift
//  Raphael
//
//  Created by Raphael Higashi Silva on 25/08/17.
//  Copyright © 2017 Raphael Higashi Silva. All rights reserved.
//
enum DataTypeApi {
    case Marca
    case Modelo
    case Tipo
    case Detalhe
}

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
    
    func responseArray(data: Data) ->  [String: Any] {
        return try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [String: Any]
    }
    
    func apiData(dataTypeApi: DataTypeApi, marca: String, modelo: String, tipo: String, onCompletion: @escaping ([[String:Any]]?) -> Void){
        
        if dataTypeApi == .Marca {
            basePath = "https://fipeapi.appspot.com/api/1/carros/marcas.json"
        }
        if dataTypeApi == .Modelo {
            basePath = "https://fipeapi.appspot.com/api/1/carros/veiculos/\(marca).json"
        }
        if dataTypeApi == .Tipo {
            basePath = "https://fipeapi.appspot.com/api/1/carros/veiculo/\(marca)/\(modelo).json"
        }
        if dataTypeApi == .Detalhe {
            basePath = "http://fipeapi.appspot.com/api/1/carros/veiculo/\(marca)/\(modelo)/\(tipo).json"
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
                    var response = [[String: Any]]()
                    
                    if dataTypeApi != .Detalhe {
                        do {
                            try response = JSONSerialization.jsonObject(with: data,
                                                                        options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
                        } catch {
                            response = [self.responseArray(data: data)]
                        }
                    } else {
                        response = [self.responseArray(data: data)]
                    }
                    onCompletion(response)
                }
            }
            }.resume()
    }
    
}
