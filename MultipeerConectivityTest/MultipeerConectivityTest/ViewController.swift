//
//  ViewController.swift
//  MultipeerConectivityTest
//
//  Created by Guilherme Piccoli on 18/06/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        DispatchQueue.main.async {
//            if let produto: Produto = SessionManager.shared.getListProdutos()?.listProdutos[0] {
//                self.label.text = produto.valor
//            }
//        }
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
    
    
}
