//
//  ViewController.swift
//  t2leilao
//
//  Created by Fernando Locatelli Maioli on 19/06/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class criarLeilaoViewController: UIViewController {
    
    @IBOutlet weak var nomeProdutoTextField: UITextField!
    @IBOutlet weak var precoInicialTextField: UITextField!
    @IBOutlet weak var nomeLeiloeiroTextField: UITextField!
    var createLeilaoDelegate: CreateLeilaoDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func finalizarCriacaoButonClicked(_ sender: UIButton) {
        var list = SessionManager.shared.getListProdutos()
        if let nomeProduto = nomeProdutoTextField.text, let nomeLeiloeiro = nomeLeiloeiroTextField.text, let valorInicial = precoInicialTextField.text {
            let leilao = Leilao.init(idLeilao: MCPeerID(displayName: UIDevice.current.name), nome: nomeProduto, nomeLeiloeiro: nomeLeiloeiro, valorInicial: valorInicial)
            SessionManager.shared.sendText(text: "criarLeilao-"+leilao.idLeilao.displayName+"-"+nomeProduto+"-"+nomeLeiloeiro+"-"+valorInicial+"-"+valorInicial)
            self.createLeilaoDelegate?.didCreateLeilao(leilao: leilao)
        }
        
    }
    
}
