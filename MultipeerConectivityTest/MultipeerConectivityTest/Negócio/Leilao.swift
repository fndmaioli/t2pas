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
        guard let listaLeiloes = ListaLeiloesAtivosDAO().getListaLeilao() else {
            listLeiloes = []
            return
        }
        self.listLeiloes = listaLeiloes
    }
    
    mutating func addLeilao(leilao: Leilao){
        listLeiloes.append(leilao)
        ListaLeiloesAtivosDAO().updateData(listaLeilao: self.listLeiloes)
    }
    
    mutating func alteraValorAtual(valor:String, id: String){
        for (i,leilao) in listLeiloes.enumerated() {
            if leilao.idLeilao == id && leilao.estadoLeilao == .OPEN{
                self.listLeiloes[i].valorAtual = valor
            }
        }
        ListaLeiloesAtivosDAO().updateData(listaLeilao: self.listLeiloes)
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
        ListaLeiloesAtivosDAO().updateData(listaLeilao: self.listLeiloes)
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
        guard let listaLeiloes = ListaLeiloesGeralDAO().getListaLeilao() else {
            self.listaLeilao = []
            return
        }
        self.listaLeilao = listaLeiloes
    }
    
    mutating func addLeilao(leilao: Leilao){
        listaLeilao.append(leilao)
        ListaLeiloesGeralDAO().updateData(listaLeilao: self.listaLeilao)
    }
    
    mutating func alteraValorAtual(valor:String, id: String){
        for (i,leilao) in listaLeilao.enumerated() {
            if leilao.idLeilao == id && leilao.estadoLeilao == .OPEN{
                self.listaLeilao[i].valorAtual = valor
            }
        }
        ListaLeiloesGeralDAO().updateData(listaLeilao: self.listaLeilao)
    }
    
    mutating func trocaEstadoLeilao(id: String) {
        for(i, leilao) in listaLeilao.enumerated() {
            if leilao.idLeilao == id {
                listaLeilao[i].estadoLeilao = .CLOSED
            }
        }
        ListaLeiloesGeralDAO().updateData(listaLeilao: self.listaLeilao)
    }

}

struct ListaLeilaoAdmin: Codable {
    
    static var shared = ListaLeilaoAdmin()
    var listaLeilao: [Leilao]
    
    private init(){
        guard let listaLeiloes = ListaLeiloesAdminDAO().getListaLeilao() else {
            self.listaLeilao = []
            return
        }
        self.listaLeilao = listaLeiloes
    }
    
    mutating func addLeilao(leilao: Leilao){
        listaLeilao.append(leilao)
        ListaLeiloesAdminDAO().updateData(listaLeilao: self.listaLeilao)
    }
    
    mutating func alteraValorAtual(valor:String, id: String){
        for (i,leilao) in listaLeilao.enumerated() {
            if leilao.idLeilao == id && leilao.estadoLeilao == .OPEN{
                self.listaLeilao[i].valorAtual = valor
            }
        }
        ListaLeiloesAdminDAO().updateData(listaLeilao: self.listaLeilao)
    }
    
    mutating func trocaEstadoLeilao(id: String) {
        for(i, leilao) in listaLeilao.enumerated() {
            if leilao.idLeilao == id {
                listaLeilao[i].estadoLeilao = .CLOSED
            }
        }
        ListaLeiloesAdminDAO().updateData(listaLeilao: self.listaLeilao)

    }
}
