//
//  ViewController.swift
//  t2leilao
//
//  Created by Fernando Locatelli Maioli on 19/06/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

class leilaoViewController: UIViewController {

    @IBOutlet weak var nomeProdutoLabel: UILabel!
    @IBOutlet weak var nomeLeiloeiroLabel: UILabel!
    @IBOutlet weak var precoInicialLabel: UILabel!
    @IBOutlet weak var precoAtualLabel: UILabel!
    @IBOutlet weak var lanceTextField: UITextField!
    var leilao: Leilao?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func darLanceButtonClicked(_ sender: UIButton) {
        guard let leilao = leilao, let lanceText = lanceTextField.text else { return }
        if Double(lanceText)! > Double(leilao.valorAtual)! {
            SessionManager.shared.sendText(text: "darLance-"+leilao.idLeilao.displayName+"-"+lanceText)
        }
    }
    
}

