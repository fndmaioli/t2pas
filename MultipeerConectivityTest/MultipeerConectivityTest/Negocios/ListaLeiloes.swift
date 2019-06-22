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
    var listaLeiloes = SessionManager.shared.getListProdutos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        leiloesTableView.dataSource = self
        leiloesTableView.delegate = self
        SessionManager.shared.updateLeiloesDelegate = self
    }
    
}

extension ListaLeiloesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaLeiloes?.listLeiloes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leiloesTableView.dequeueReusableCell(withIdentifier: "leilao") as! leilaoCell
        let leilao = listaLeiloes?.listLeiloes[indexPath.row]
        print("to no dequeue")
        print(leilao)

        cell.nomeLeiloeiro.text = leilao?.nomeLeiloeiro
        cell.nomeProduto.text = leilao?.nome
        cell.precoInicial.text = leilao?.valorInicial
        cell.precoAtual.text = leilao?.valorAtual
        
        return cell
    }
    
    
    
}

extension ListaLeiloesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showLeilao", sender: listaLeiloes?.listLeiloes[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let viewController = segue.destination as? leilaoViewController, let leilao = sender as? Leilao else {return}
        //if let viewController = segue.destination as? leilaoViewController, let leilao = sender as? Leilao {
            viewController.nomeProduto = leilao.nome
            viewController.nomeLeiloeiro = leilao.nomeLeiloeiro
            viewController.precoInicial = leilao.valorInicial
            viewController.precoAtual = leilao.valorAtual
            viewController.leilao = leilao
        //}
    }
    
}

extension ListaLeiloesViewController: updateLeiloesListDelegate {
    func didChangeLeiloesData() {
        DispatchQueue.main.async {
            self.leiloesTableView.reloadData()
        }
        print("DKSAPODKSAPOD")
        print(listaLeiloes)
    }
    
}

