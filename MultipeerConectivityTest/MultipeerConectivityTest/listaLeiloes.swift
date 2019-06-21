//
//  ViewController.swift
//  t2leilao
//
//  Created by Fernando Locatelli Maioli on 19/06/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

class listaLeiloesViewController: UIViewController {
    
    @IBOutlet weak var leiloesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        leiloesTableView.dataSource = self
        leiloesTableView.delegate = self
        
    }
    
}

extension listaLeiloesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leiloesTableView.dequeueReusableCell(withIdentifier: "leilao") as! UITableViewCell
        
        return cell
    }
    
    
    
}

extension listaLeiloesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showLeilao", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}

