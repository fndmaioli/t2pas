//
//  ViewController.swift
//  t2leilao
//
//  Created by Fernando Locatelli Maioli on 19/06/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit


class ListaLeiloesAdminViewController: UIViewController {
    
    @IBOutlet weak var leiloesTableView: UITableView!
    var listaLeiloes = ListaLeilao.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        leiloesTableView.dataSource = self
        SessionManager.shared.updateLeiloesDelegate = self
    }
    
}

extension ListaLeiloesAdminViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListaLeilaoAdmin.shared.listaLeilao.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leiloesTableView.dequeueReusableCell(withIdentifier: "leilaoAdmin") as! leilaoCell
        let leilao = ListaLeilaoAdmin.shared.listaLeilao[indexPath.row]
        
        cell.nomeLeiloeiro.text = leilao.nomeLeiloeiro
        cell.nomeProduto.text = leilao.nome
        cell.precoInicial.text = leilao.valorInicial
        cell.precoAtual.text = leilao.valorAtual
        cell.leilaoID.text = leilao.idLeilao
        if leilao.estadoLeilao == .CLOSED {
            cell.estadoLeilao.text = "Fechado"
        } else {
            cell.estadoLeilao.text = "Aberto"
        }
        
        return cell
    }
}

extension ListaLeiloesAdminViewController: updateLeiloesListDelegate {
    func didChangeLeiloesData() {
        DispatchQueue.main.async {
            self.leiloesTableView.reloadData()
        }
    }
}
