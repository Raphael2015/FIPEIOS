//
//  TiposTableViewController.swift
//  Raphael
//
//  Created by Raphael Higashi Silva on 30/08/17.
//  Copyright © 2017 Raphael Higashi Silva. All rights reserved.
//

import UIKit

class TiposTableViewController: UITableViewController{
    
    var tipos = [Tipo]()
    
    var marca_selecionada: Marca!// captura parametro
    var modelo_selecionado: Modelo!// captura parametro
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTipos()
        self.navigationItem.title = modelo_selecionado.name_model
    }
    func loadTipos(){
        TiposServices().getTipos(marca: String(marca_selecionada.id_brand), modelo: modelo_selecionado.id_model) {
            self.tipos = $0
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tipos.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTipo", for: indexPath)
        let tipo = tipos[indexPath.row]
        cell.textLabel?.text = tipo.name_type
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = tipos[indexPath.row]
        performSegue(withIdentifier: "sgEnd", sender: item)
    }
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! FinalViewController
        vc.marca = marca_selecionada
        vc.modelo = modelo_selecionado
        vc.tipo = sender as! Tipo
    }
}
