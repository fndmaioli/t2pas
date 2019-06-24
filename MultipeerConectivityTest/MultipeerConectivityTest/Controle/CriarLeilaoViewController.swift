//
//  ViewController.swift
//  t2leilao
//
//  Created by Fernando Locatelli Maioli on 19/06/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class CriarLeilaoViewController: UIViewController {
    
    @IBOutlet weak var nomeProdutoTextField: UITextField!
    @IBOutlet weak var precoInicialTextField: UITextField!
    @IBOutlet weak var nomeLeiloeiroTextField: UITextField!
    var createLeilaoDelegate: CreateLeilaoDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func finalizarCriacaoButonClicked(_ sender: UIButton) {
        if (createLeilaoDelegate?.hasActiveLeilao())! {
            return
        }
        if let nomeProduto = nomeProdutoTextField.text, let nomeLeiloeiro = nomeLeiloeiroTextField.text, let valorInicial = precoInicialTextField.text {
            let leilao = Leilao.init(idLeilao: UIDevice.current.name, nome: nomeProduto, nomeLeiloeiro: nomeLeiloeiro, valorInicial: valorInicial)
            SessionManager.shared.sendText(text: "criarLeilao-"+leilao.idLeilao+"-"+nomeProduto+"-"+nomeLeiloeiro+"-"+valorInicial+"-"+valorInicial)
//            ListaLeilao.shared.addLeilao(leilao: leilao)
//            ListaLeilaoGeral.shared.addLeilao(leilao: leilao)
//            ListaLeilaoAdmin.shared.addLeilao(leilao: leilao)
            FacadeListaLeilao().addLeilao(leilao: leilao)

            
//            let userDefaults = UserDefaults.standard
//
//            if let encoded = try? JSONEncoder().encode(ListaLeilao.shared) {
//                userDefaults.set(encoded, forKey: "listaLeilao")
//            }
//            userDefaults.synchronize()
//
//
//            if let listData = UserDefaults.standard.object(forKey: "listaLeilao") as? Data, let listDecoded = try? JSONDecoder().decode(ListaLeilao.self, from: listData) {
//                print(listDecoded)
//            }
            
            self.createLeilaoDelegate?.didCreateLeilao(leilao: leilao)
        }
        
    }
    
}

