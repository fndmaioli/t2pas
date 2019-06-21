//
//  Produto.swift
//  MultipeerConectivityTest
//
//  Created by Guilherme Piccoli on 19/06/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation

struct Leilao {
    var nome: String
    var nomeLeiloeiro: String
    var valorInicial: String
    var valorAtual: String
}

struct ListaLeilao {
    
    var listLeiloes : [Leilao]
    
    mutating func addLeilao(leilao: Leilao){
        listLeiloes.append(leilao)
    }
}
