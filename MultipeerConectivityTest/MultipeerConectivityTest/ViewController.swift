//
//  ViewController.swift
//  MultipeerConectivityTest
//
//  Created by Guilherme Piccoli on 18/06/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import UIKit
import MultipeerConnectivity

protocol CreateLeilaoDelegate {
    
    func didCreateLeilao(leilao: Leilao)
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nomeProdutoLabel: UILabel!
    @IBOutlet weak var nomeLeiloeiroLabel: UILabel!
    @IBOutlet weak var precoInicialLabel: UILabel!
    @IBOutlet weak var precoAtualLabel: UILabel!
    var leilao: Leilao?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SessionManager.shared.createLeilaoDelegate = self
        
//        DispatchQueue.main.async {
//            if let produto: Produto = SessionManager.shared.getListProdutos()?.listProdutos[0] {
//                self.label.text = produto.valor
//            }
//        }
    }
    
    @IBAction func criarLeilaoButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "criaLeilao", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? criarLeilaoViewController {
            viewController.createLeilaoDelegate = self
        }
    }
    
//    @IBAction func buttonSendText(_ sender: UIButton) {
//        SessionManager.shared.sendText(text: textField.text!)
//        label.text = textField.text!
//    }
    
    @IBAction func hostButton(_ sender: UIButton) {
        SessionManager.shared.startHosting()
    }
    
    @IBAction func joinSession(_ sender: UIButton) {
        let hostViewController = SessionManager.shared.joinSession()
        present(hostViewController,animated: true)
    }
    
    @IBAction func fecharLeilaoButtonClicked(_ sender: UIButton) {
        self.nomeProdutoLabel.text = "Nome do produto"
        self.nomeLeiloeiroLabel.text = "Nome do leiloeiro"
        self.precoInicialLabel.text = "Preco inicial"
        self.precoAtualLabel.text = "Preco atual"
        guard let leilao = leilao else { return }
        SessionManager.shared.sendText(text: "fecharLeilao-"+leilao.idLeilao.displayName)
    }
}
extension ViewController: CreateLeilaoDelegate {
    
    func didCreateLeilao(leilao: Leilao) {
        if leilao.idLeilao == MCPeerID(displayName: UIDevice.current.name) {
            self.leilao = leilao
            self.nomeProdutoLabel.text = leilao.nome
            self.nomeLeiloeiroLabel.text = leilao.nomeLeiloeiro
            self.precoInicialLabel.text = leilao.valorInicial
            self.precoAtualLabel.text = leilao.valorAtual
        } 
    }
}
