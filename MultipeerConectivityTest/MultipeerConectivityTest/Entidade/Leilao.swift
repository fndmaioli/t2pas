//
//  Produto.swift
//  MultipeerConectivityTest
//
//  Created by Guilherme Piccoli on 19/06/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation
import MultipeerConnectivity

enum EstadoLeilao {
    case OPEN
    case CLOSED
}

struct Leilao {
    var idLeilao: MCPeerID
    var nome: String
    var nomeLeiloeiro: String
    var valorInicial: String
    var valorAtual: String
    var estadoLeilao: EstadoLeilao
    
    init(idLeilao: MCPeerID,nome: String, nomeLeiloeiro: String, valorInicial: String) {
        self.idLeilao = idLeilao
        self.nome = nome
        self.nomeLeiloeiro = nomeLeiloeiro
        self.valorInicial = valorInicial
        self.valorAtual = valorInicial
        estadoLeilao = .OPEN
    }
    
    mutating func setEstadoLeilao(novoEstado: EstadoLeilao){
        self.estadoLeilao = novoEstado
    }
}

struct ListaLeilao {
    
    var listLeiloes : [Leilao]
    
    mutating func addLeilao(leilao: Leilao){
        listLeiloes.append(leilao)
    }
    
    mutating func removeLeilao(leilaoId: MCPeerID){
        listLeiloes.removeAll { ( leilao) -> Bool in
            if leilao.idLeilao == leilaoId {
                var leilaoRemoved = leilao
                leilaoRemoved.setEstadoLeilao(novoEstado: .CLOSED)
                ListaLeilaoFechado.shared.addLeilao(leilao: leilaoRemoved)
                return true
            }
            return false
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

struct ListaLeilaoFechado {
    
    static var shared = ListaLeilaoFechado()
    var listaLeilaoFechado: [Leilao]
    
    private init(){
        listaLeilaoFechado = []
    }
    
    mutating func addLeilao(leilao: Leilao){
        listaLeilaoFechado.append(leilao)
    }
}
