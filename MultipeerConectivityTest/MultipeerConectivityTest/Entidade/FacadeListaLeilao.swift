//
//  FachadeLista.swift
//  MultipeerConectivityTest
//
//  Created by Fernando Locatelli Maioli on 24/06/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation

struct FacadeListaLeilao {
    
    func alteraValorAtual(valor:String, id: String){
        ListaLeilaoAdmin.shared.alteraValorAtual(valor: valor, id: id)
        ListaLeilaoGeral.shared.alteraValorAtual(valor: valor, id: id)
        ListaLeilao.shared.alteraValorAtual(valor: valor, id: id)
    }
    
    func trocaEstadoLeilao(id: String) {
        ListaLeilaoAdmin.shared.trocaEstadoLeilao(id: id)
        ListaLeilaoGeral.shared.trocaEstadoLeilao(id: id)
    }
}
