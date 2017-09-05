//
//  MarcasTableViewController.swift
//  Raphael
//
//  Created by Raphael Higashi Silva on 25/08/17.
//  Copyright © 2017 Raphael Higashi Silva. All rights reserved.
//

import UIKit

class MarcasTableViewController: UITableViewController{
    
    var marcas = [Marca]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMarcas()
    }
    func loadMarcas(){
        MarcasServices().getMarcas{
            self.marcas = $0
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marcas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellMarca", for: indexPath)
        let marca = marcas[indexPath.row]
        cell.textLabel?.text = marca.name_brand
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let marca_selecionada = marcas[indexPath.row]
        performSegue(withIdentifier: "sgModelo", sender: marca_selecionada)
    }
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc = segue.destination as! ModelosTableViewController
            vc.marca_selecionada = sender as! Marca
    }
    
}
