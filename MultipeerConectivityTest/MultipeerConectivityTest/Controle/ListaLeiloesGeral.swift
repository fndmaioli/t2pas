//
//  ViewController.swift
//  t2leilao
//
//  Created by Fernando Locatelli Maioli on 19/06/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit


class ListaLeiloesGeralViewController: UIViewController {
    
    @IBOutlet weak var leiloesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        leiloesTableView.dataSource = self
        SessionManager.shared.updateLeiloesDelegate = self
        
  
        }
    }


extension ListaLeiloesGeralViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListaLeilaoGeral.shared.listaLeilao.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leiloesTableView.dequeueReusableCell(withIdentifier: "leilaoGeral") as! leilaoCell
        let leilao = ListaLeilaoGeral.shared.listaLeilao[indexPath.row]
        
        cell.nomeLeiloeiro.text = leilao.nomeLeiloeiro
        cell.nomeProduto.text = leilao.nome
        cell.precoInicial.text = "Valor inicial: R$\(leilao.valorInicial)"
        cell.precoAtual.text = "Valor atual: R$\(leilao.valorAtual)"
        if leilao.estadoLeilao == .CLOSED {
            cell.estadoLeilao.text = "Fechado"
            cell.estadoLeilao.textColor = .red
        } else {
            cell.estadoLeilao.text = "Aberto"
            cell.estadoLeilao.textColor = .green
        }
        
        return cell
    }
    
    
    
}


extension ListaLeiloesGeralViewController: updateLeiloesListDelegate {
    func didChangeLeiloesData() {
        DispatchQueue.main.async {
            self.leiloesTableView.reloadData()
        }
    }
    
}

