//
//  Produto.swift
//  MultipeerConectivityTest
//
//  Created by Guilherme Piccoli on 19/06/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation
import MultipeerConnectivity

enum EstadoLeilao: String, Codable  {
    
    case OPEN
    case CLOSED
}

struct Leilao: Codable {
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
}

struct ListaLeilao: Codable {
    
    var listLeiloes : [Leilao]
    
    static var shared = ListaLeilao()
    
    private init(){
        listLeiloes = []
    }
    
    mutating func addLeilao(leilao: Leilao){
        listLeiloes.append(leilao)
    }
    
    mutating func alteraValorAtual(valor:String, id: String){
        for (i,leilao) in listLeiloes.enumerated() {
            if leilao.idLeilao == id && leilao.estadoLeilao == .OPEN{
                self.listLeiloes[i].valorAtual = valor
            }
        }
    }
    
    func getListLeilao() -> [Leilao] {
        var listFiltradoLeiloes: [Leilao] = []
        for leilao in listLeiloes {
            if leilao.idLeilao != UIDevice.current.name {
                listFiltradoLeiloes.append(leilao)
            }
        }
        return listFiltradoLeiloes
    }
    
    mutating func trocaEstadoLeilao(id: String) {
        for(i, leilao) in listLeiloes.enumerated() {
            if leilao.idLeilao == id {
                listLeiloes[i].estadoLeilao = .CLOSED
            }
        }
    }
    
    mutating func removeLeilao(leilaoId: String){
        listLeiloes.removeAll { ( leilao) -> Bool in
            if leilao.idLeilao == leilaoId {
                let leilaoRemoved = leilao
//                leilaoRemoved.estadoLeilao = .CLOSED
//                ListaLeilaoAdmin.shared.trocaEstadoLeilao(id: leilaoRemoved.idLeilao)
//                ListaLeilaoGeral.shared.trocaEstadoLeilao(id: leilaoRemoved.idLeilao)
                FacadeListaLeilao().trocaEstadoLeilao(id: leilaoRemoved.idLeilao)
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

struct ListaLeilaoGeral: Codable {
    
    static var shared = ListaLeilaoGeral()
    var listaLeilao: [Leilao]

    
    private init(){
        listaLeilao = []
    }
    
    mutating func addLeilao(leilao: Leilao){
        listaLeilao.append(leilao)
    }
    
    mutating func alteraValorAtual(valor:String, id: String){
        for (i,leilao) in listaLeilao.enumerated() {
            if leilao.idLeilao == id && leilao.estadoLeilao == .OPEN{
                self.listaLeilao[i].valorAtual = valor
            }
        }
    }
    
    mutating func trocaEstadoLeilao(id: String) {
        for(i, leilao) in listaLeilao.enumerated() {
            if leilao.idLeilao == id {
                listaLeilao[i].estadoLeilao = .CLOSED
            }
        }
    }

}

struct ListaLeilaoAdmin: Codable {
    
    static var shared = ListaLeilaoAdmin()
    var listaLeilao: [Leilao]
    
    private init(){
        listaLeilao = []
    }
    
    mutating func addLeilao(leilao: Leilao){
        listaLeilao.append(leilao)
    }
    
    mutating func alteraValorAtual(valor:String, id: String){
        for (i,leilao) in listaLeilao.enumerated() {
            if leilao.idLeilao == id && leilao.estadoLeilao == .OPEN{
                self.listaLeilao[i].valorAtual = valor
            }
        }
    }
    
    mutating func trocaEstadoLeilao(id: String) {
        for(i, leilao) in listaLeilao.enumerated() {
            if leilao.idLeilao == id {
                listaLeilao[i].estadoLeilao = .CLOSED
            }
        }
    }
}
