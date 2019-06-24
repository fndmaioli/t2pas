//
//  ViewController.swift
//  t2leilao
//
//  Created by Fernando Locatelli Maioli on 19/06/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

protocol updateLeiloesListDelegate {
    func didChangeLeiloesData()
}

class ListaLeiloesViewController: UIViewController {
    
    @IBOutlet weak var leiloesTableView: UITableView!
    var listaLeiloes = ListaLeilao.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        leiloesTableView.dataSource = self
        leiloesTableView.delegate = self
        SessionManager.shared.updateLeiloesDelegate = self
        
        DispatchQueue.main.async {
            self.leiloesTableView.reloadData()
        }
    }
}

extension ListaLeiloesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListaLeilao.shared.getListLeilao().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leiloesTableView.dequeueReusableCell(withIdentifier: "leilao") as! leilaoCell
        let leilao = ListaLeilao.shared.getListLeilao()[indexPath.row]

        cell.nomeLeiloeiro.text = leilao.nomeLeiloeiro
        cell.nomeProduto.text = leilao.nome
        cell.precoInicial.text = "Valor inicial: \(leilao.valorInicial)"
        cell.precoAtual.text = "Valor atual: \(leilao.valorAtual)"
        
        return cell
    }
}

extension ListaLeiloesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showLeilao", sender: listaLeiloes.getListLeilao()[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let viewController = segue.destination as? LeilaoViewController,
            let leilao = sender as? Leilao else {return}
            viewController.nomeProduto = "Produto: \(leilao.nome)"
            viewController.nomeLeiloeiro = "Leiloeiro: \(leilao.nomeLeiloeiro)"
            viewController.precoInicial = "Preco inicial: \(leilao.valorInicial)"
            viewController.precoAtual = "Preco atual: \(leilao.valorAtual)"
            viewController.leilao = leilao
    }
    
}

extension ListaLeiloesViewController: updateLeiloesListDelegate {
    func didChangeLeiloesData() {
        DispatchQueue.main.async {
            self.leiloesTableView.reloadData()
        }
    }
    
}

