//
//  Produto.swift
//  MultipeerConectivityTest
//
//  Created by Guilherme Piccoli on 19/06/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation
import MultipeerConnectivity

struct Leilao {
    var idLeilao: MCPeerID
    var nome: String
    var nomeLeiloeiro: String
    var valorInicial: String
    var valorAtual: String
    
    init(idLeilao: MCPeerID,nome: String, nomeLeiloeiro: String, valorInicial: String) {
        self.idLeilao = idLeilao
        self.nome = nome
        self.nomeLeiloeiro = nomeLeiloeiro
        self.valorInicial = valorInicial
        self.valorAtual = valorInicial
    }
}

struct ListaLeilao {
    
    var listLeiloes : [Leilao]
    
    mutating func addLeilao(leilao: Leilao){
        listLeiloes.append(leilao)
    }
    
    mutating func removeLeilao(leilaoId: MCPeerID){
        listLeiloes.removeAll { (leilao) -> Bool in
            return leilao.idLeilao == leilaoId
        }
    }
    
    func searchLeilaoById(id: MCPeerID) -> Leilao? {
        for leilao in listLeiloes {
            if leilao.idLeilao == id {
                return leilao
            }
        }
        
        return nil
    }
    
}
