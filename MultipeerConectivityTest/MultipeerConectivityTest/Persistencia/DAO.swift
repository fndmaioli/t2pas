//
//  Dao.swift
//  MultipeerConectivityTest
//
//  Created by Fernando Locatelli Maioli on 24/06/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation


protocol DAO {
    func updateData(listaLeilao: [Leilao])
    func getListaLeilao() -> [Leilao]?
}

class ListaLeiloesAtivosDAO: DAO {
    
    func getListaLeilao() -> [Leilao]? {
        if let listData = UserDefaults.standard.data(forKey: "listaLeilao") , let listDecoded = try? JSONDecoder().decode([Leilao].self, from: listData) {
            return listDecoded
        }
        return nil
    }
    
    func updateData(listaLeilao: [Leilao]) {
        let userDefaults = UserDefaults.standard
        if let encoded = try? JSONEncoder().encode(listaLeilao) {
            userDefaults.set(encoded, forKey: "listaLeilao")
        }
        userDefaults.synchronize()
    }
}

class ListaLeiloesGeralDAO: DAO {
    
    func getListaLeilao() -> [Leilao]? {
        if let listData = UserDefaults.standard.object(forKey: "listaLeilaoGeral") as? Data, let listDecoded = try? JSONDecoder().decode([Leilao].self, from: listData) {
            return listDecoded
        }
        return nil
    }
    
    func updateData(listaLeilao: [Leilao]) {
        let userDefaults = UserDefaults.standard
        if let encoded = try? JSONEncoder().encode(listaLeilao) {
            userDefaults.set(encoded, forKey: "listaLeilaoGeral")
        }
        userDefaults.synchronize()
    }
    
}

class ListaLeiloesAdminDAO: DAO {
    
    func getListaLeilao() -> [Leilao]? {
        if let listData = UserDefaults.standard.object(forKey: "listaLeilaoAdmin") as? Data, let listDecoded = try? JSONDecoder().decode([Leilao].self, from: listData) {
            return listDecoded
        }
        return nil
    }
    
    func updateData(listaLeilao: [Leilao]) {
        let userDefaults = UserDefaults.standard
        if let encoded = try? JSONEncoder().encode(listaLeilao) {
            userDefaults.set(encoded, forKey: "listaLeilaoAdmin")
        }
        userDefaults.synchronize()
    }
    
}
