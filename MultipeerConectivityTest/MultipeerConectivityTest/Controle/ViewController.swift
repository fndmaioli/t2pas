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
    func hasActiveLeilao() -> Bool
}

class ViewController: UIViewController {
    
    @IBOutlet weak var leilaoAndamentoLabel: UILabel!
    @IBOutlet weak var fecharLeilaoButton: UIButton!
    @IBOutlet weak var nomeProdutoLabel: UILabel!
    @IBOutlet weak var nomeLeiloeiroLabel: UILabel!
    @IBOutlet weak var precoInicialLabel: UILabel!
    @IBOutlet weak var precoAtualLabel: UILabel!
    var leilao: Leilao?
    
    @IBOutlet weak var adminButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SessionManager.shared.createLeilaoDelegate = self
        adminButton.isHidden = true
    }
    
    @IBAction func criarLeilaoButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "criaLeilao", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? CriarLeilaoViewController {
            viewController.createLeilaoDelegate = self
        }
    }
    
    @IBAction func hostButton(_ sender: UIButton) {
        SessionManager.shared.startHosting()
        adminButton.isHidden = false
    }
    
    @IBAction func joinSession(_ sender: UIButton) {
        let hostViewController = SessionManager.shared.joinSession()
        present(hostViewController,animated: true)
    }
    
    @IBAction func fecharLeilaoButtonClicked(_ sender: UIButton) {
        self.nomeProdutoLabel.text = ""
        self.nomeLeiloeiroLabel.text = ""
        self.precoInicialLabel.text = ""
        self.precoAtualLabel.text = ""
        self.fecharLeilaoButton.isHidden = true
        self.leilaoAndamentoLabel.isHidden = true
        guard let leilao = leilao else { return }
        ListaLeilao.shared.removeLeilao(leilaoId: leilao.idLeilao)
        SessionManager.shared.sendText(text: "fecharLeilao-"+leilao.idLeilao)
        self.leilao = nil
    }
}
extension ViewController: CreateLeilaoDelegate {
    
    func hasActiveLeilao() -> Bool {
        return self.leilao != nil
    }
    
    func didCreateLeilao(leilao: Leilao) {
        if leilao.idLeilao == UIDevice.current.name {
            DispatchQueue.main.async {
                self.leilao = leilao
                self.nomeProdutoLabel.text = "Produto: \(leilao.nome)"
                self.nomeLeiloeiroLabel.text = "Leiloeiro: \(leilao.nomeLeiloeiro)"
                self.precoInicialLabel.text = "Preço Inicial: R$\(leilao.valorInicial)"
                self.precoAtualLabel.text = "Preço atual: R$\(leilao.valorAtual)"
                self.fecharLeilaoButton.isHidden  = false
                self.leilaoAndamentoLabel.isHidden = false
            }
        }
    }
}
