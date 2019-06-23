//
//  Produto.swift
//  MultipeerConectivityTest
//
//  Created by Guilherme Piccoli on 19/06/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation
import MultipeerConnectivity

enum EstadoLeilao  {
    case OPEN
    case CLOSED
}

struct Leilao {
    var idLeilao: String
    var nome: String
    var nomeLeiloeiro: String
    var valorInicial: String
    var valorAtual: String
    var estadoLeilao: EstadoLeilao
    
    init(idLeilao: String,nome: String, nomeLeiloeiro: String, valorInicial: String) {
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
    
    static var shared = ListaLeilao()
    
    private init(){
        listLeiloes = []
    }
    
    mutating func addLeilao(leilao: Leilao){
        listLeiloes.append(leilao)
    }
    
    mutating func removeLeilao(leilaoId: String){
        listLeiloes.removeAll { ( leilao) -> Bool in
            if leilao.idLeilao == leilaoId {
                var leilaoRemoved = leilao
                leilaoRemoved.setEstadoLeilao(novoEstado: .CLOSED)
                return true
            }
            return false
        }
    }
    
    func searchLeilaoById(id: String) -> Leilao? {
        for leilao in listLeiloes {
            if leilao.idLeilao == id {
                return leilao
            }
        }
        return nil
    }
    
}

struct ListaLeilaoGeral {
    
    static var shared = ListaLeilaoGeral()
    var listaLeilao: [Leilao]

    
    private init(){
        listaLeilao = []
    }
    
    mutating func addLeilao(leilao: Leilao){
        listaLeilao.append(leilao)
    }

}

struct ListaLeilaoAdmin {
    
    static var shared = ListaLeilaoAdmin()
    var listaLeilao: [Leilao]
    
    private init(){
        listaLeilao = []
    }
    
    mutating func addLeilao(leilao: Leilao){
        listaLeilao.append(leilao)
    }
}
