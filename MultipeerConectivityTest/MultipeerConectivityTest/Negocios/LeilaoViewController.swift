//
//  ViewController.swift
//  t2leilao
//
//  Created by Fernando Locatelli Maioli on 19/06/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

class LeilaoViewController: UIViewController {
    
    var nomeProduto: String?
    var nomeLeiloeiro: String?
    var precoInicial: String?
    var precoAtual: String?
    var lance: String?

    @IBOutlet weak var nomeProdutoLabel: UILabel!
    @IBOutlet weak var nomeLeiloeiroLabel: UILabel!
    @IBOutlet weak var precoInicialLabel: UILabel!
    @IBOutlet weak var precoAtualLabel: UILabel!
    @IBOutlet weak var lanceTextField: UITextField!
    var leilao: Leilao?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nomeProdutoLabel.text = nomeProduto
        nomeLeiloeiroLabel.text = nomeLeiloeiro
        precoInicialLabel.text = precoInicial
        precoAtualLabel.text = precoAtual
       // lanceTextField.text = lance
    }
    
    @IBAction func darLanceButtonClicked(_ sender: UIButton) {
        guard let leilao = self.leilao, let lanceText = self.lanceTextField.text else { return }
        if Double(lanceText)! > Double(leilao.valorAtual)! {
            SessionManager.shared.sendText(text: "darLance-"+leilao.idLeilao+"-"+lanceText)
            SessionManager.shared.updateLeiloesDelegate?.didChangeLeiloesData()
        }
    }
    
}

