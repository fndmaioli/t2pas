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

class listaLeiloesViewController: UIViewController {
    
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

extension listaLeiloesViewController: UITableViewDataSource {
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

extension listaLeiloesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showLeilao", sender: listaLeiloes?.listLeiloes[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? leilaoViewController, let leilao = sender as? Leilao {
            viewController.nomeProdutoLabel.text = leilao.nome
            viewController.nomeLeiloeiroLabel.text = leilao.nomeLeiloeiro
            viewController.precoInicialLabel.text = leilao.valorInicial
            viewController.precoAtualLabel.text = leilao.valorAtual
            viewController.leilao = leilao
        }
    }
    
}

extension listaLeiloesViewController: updateLeiloesListDelegate {
    func didChangeLeiloesData() {
        DispatchQueue.main.async {
            self.leiloesTableView.reloadData()
        }
        print("DKSAPODKSAPOD")
        print(listaLeiloes)
    }
    
}

