//
//  ModelosTableViewController.swift
//  Raphael
//
//  Created by Raphael Higashi Silva on 25/08/17.
//  Copyright © 2017 Raphael Higashi Silva. All rights reserved.
//

import UIKit

class ModelosTableViewController: UITableViewController{
    var modelos = [Modelo]()
    var marca_selecionada:Marca!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadModelos()
        self.navigationItem.title = marca_selecionada.name_brand
    }
    func loadModelos(){
        ModelosServices().getModelos(marca: String(marca_selecionada.id_brand)){
            self.modelos = $0
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelos.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellModelo", for: indexPath)
        let modelo = modelos[indexPath.row]
        cell.textLabel?.text = modelo.name_model
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modelo_selecionado = modelos[indexPath.row]
        performSegue(withIdentifier: "sgTipo", sender: modelo_selecionado)
    }
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! TiposTableViewController
        vc.modelo_selecionado = sender as! Modelo
        vc.marca_selecionada = marca_selecionada
    }

}
