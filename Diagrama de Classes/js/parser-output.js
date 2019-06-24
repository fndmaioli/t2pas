var entities = [{
  "id": 1,
  "typeString": "class",
  "properties": [
    {
  "name": "var nomeProdutoTextField: UITextField!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var precoInicialTextField: UITextField!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nomeLeiloeiroTextField: UITextField!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var createLeilaoDelegate: CreateLeilaoDelegate?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "finalizarCriacaoButonClicked(_ sender: UIButton)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "CriarLeilaoViewController",
  "superClass": 32
},{
  "id": 2,
  "typeString": "protocol",
  "methods": [
    {
  "name": "didCreateLeilao(leilao: Leilao)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "hasActiveLeilao() -> Bool",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "CreateLeilaoDelegate"
},{
  "id": 3,
  "typeString": "class",
  "properties": [
    {
  "name": "var leilaoAndamentoLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var fecharLeilaoButton: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nomeProdutoLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nomeLeiloeiroLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var precoInicialLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var precoAtualLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var leilao: Leilao?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var adminButton: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "criarLeilaoButtonClicked(_ sender: UIButton)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "prepare(for segue: UIStoryboardSegue, sender: Any?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "hostButton(_ sender: UIButton)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "joinSession(_ sender: UIButton)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "fecharLeilaoButtonClicked(_ sender: UIButton)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ViewController",
  "superClass": 32,
  "extensions": [
    4
  ]
},{
  "id": 5,
  "typeString": "protocol",
  "methods": [
    {
  "name": "didChangeLeiloesData()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "updateLeiloesListDelegate"
},{
  "id": 6,
  "typeString": "class",
  "properties": [
    {
  "name": "var leiloesTableView: UITableView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var listaLeiloes",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ListaLeiloesViewController",
  "superClass": 32,
  "extensions": [
    7,
    8,
    9
  ]
},{
  "id": 10,
  "typeString": "class",
  "properties": [
    {
  "name": "var nomeProduto: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nomeLeiloeiro: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var precoInicial: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var precoAtual: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lance: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nomeProdutoLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nomeLeiloeiroLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var precoInicialLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var precoAtualLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lanceTextField: UITextField!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var leilao: Leilao?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "darLanceButtonClicked(_ sender: UIButton)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "LeilaoViewController",
  "superClass": 32
},{
  "id": 11,
  "typeString": "class",
  "properties": [
    {
  "name": "var leiloesTableView: UITableView!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ListaLeiloesGeralViewController",
  "superClass": 32,
  "extensions": [
    12,
    13
  ]
},{
  "id": 14,
  "typeString": "class",
  "properties": [
    {
  "name": "var leiloesTableView: UITableView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var listaLeiloes",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ListaLeiloesAdminViewController",
  "superClass": 32,
  "extensions": [
    15,
    16
  ]
},{
  "id": 17,
  "typeString": "class",
  "properties": [
    {
  "name": "var estadoLeilao: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nomeLeiloeiro: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nomeProduto: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var precoInicial: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var precoAtual: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var leilaoID: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "leilaoCell",
  "superClass": 33
},{
  "id": 18,
  "typeString": "class",
  "properties": [
    {
  "name": "var window: UIWindow? lazy",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var persistentContainer: NSPersistentContainer",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let container",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let error",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillResignActive(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationDidEnterBackground(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillEnterForeground(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationDidBecomeActive(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillTerminate(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "saveContext ()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    35
  ],
  "name": "AppDelegate",
  "superClass": 34
},{
  "id": 19,
  "typeString": "class",
  "properties": [
    {
  "name": "let shared",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "var peerID: MCPeerID!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var isHost: Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var mcSession: MCSession!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var mcAdvertierAssistant: MCAdvertiserAssistant!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var updateLeiloesDelegate: updateLeiloesListDelegate?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var createLeilaoDelegate: CreateLeilaoDelegate?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "private"
}
  ],
  "name": "SessionManager",
  "superClass": 36,
  "extensions": [
    20,
    21
  ]
},{
  "id": 22,
  "typeString": "protocol",
  "methods": [
    {
  "name": "updateData(listaLeilao: [Leilao])",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getListaLeilao() -> [Leilao]?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "DAO"
},{
  "id": 23,
  "typeString": "class",
  "methods": [
    {
  "name": "getListaLeilao() -> [Leilao]?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updateData(listaLeilao: [Leilao])",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    22
  ],
  "name": "ListaLeiloesAtivosDAO"
},{
  "id": 24,
  "typeString": "class",
  "methods": [
    {
  "name": "getListaLeilao() -> [Leilao]?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updateData(listaLeilao: [Leilao])",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    22
  ],
  "name": "ListaLeiloesGeralDAO"
},{
  "id": 25,
  "typeString": "class",
  "methods": [
    {
  "name": "getListaLeilao() -> [Leilao]?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updateData(listaLeilao: [Leilao])",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    22
  ],
  "name": "ListaLeiloesAdminDAO"
},{
  "id": 26,
  "typeString": "struct",
  "methods": [
    {
  "name": "alteraValorAtual(valor:String, id: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "trocaEstadoLeilao(id: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "addLeilao(leilao: Leilao)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "FacadeListaLeilao"
},{
  "id": 27,
  "typeString": "enum",
  "protocols": [
    38
  ],
  "cases": [
    {
  "name": "OPEN case CLOSED"
}
  ],
  "name": "EstadoLeilao",
  "superClass": 37
},{
  "id": 28,
  "typeString": "struct",
  "properties": [
    {
  "name": "var idLeilao: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nome: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nomeLeiloeiro: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var valorInicial: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var valorAtual: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var estadoLeilao: EstadoLeilao",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init(idLeilao: String,nome: String, nomeLeiloeiro: String, valorInicial: String)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    38
  ],
  "name": "Leilao"
},{
  "id": 29,
  "typeString": "struct",
  "properties": [
    {
  "name": "var listLeiloes : [Leilao]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var shared",
  "type": "type",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "addLeilao(leilao: Leilao)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "alteraValorAtual(valor:String, id: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getListLeilao() -> [Leilao]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "trocaEstadoLeilao(id: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "removeLeilao(leilaoId: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "searchLeilaoById(id: String) -> Leilao?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "private"
}
  ],
  "protocols": [
    38
  ],
  "name": "ListaLeilao"
},{
  "id": 30,
  "typeString": "struct",
  "properties": [
    {
  "name": "var shared",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "var listaLeilao: [Leilao] mutating mutating mutating",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "addLeilao(leilao: Leilao)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "alteraValorAtual(valor:String, id: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "trocaEstadoLeilao(id: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "private"
}
  ],
  "protocols": [
    38
  ],
  "name": "ListaLeilaoGeral"
},{
  "id": 31,
  "typeString": "struct",
  "properties": [
    {
  "name": "var shared",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "var listaLeilao: [Leilao] mutating mutating mutating",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "addLeilao(leilao: Leilao)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "alteraValorAtual(valor:String, id: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "trocaEstadoLeilao(id: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "private"
}
  ],
  "protocols": [
    38
  ],
  "name": "ListaLeilaoAdmin"
},{
  "id": 32,
  "typeString": "class",
  "name": "UIViewController"
},{
  "id": 33,
  "typeString": "class",
  "name": "UITableViewCell"
},{
  "id": 34,
  "typeString": "class",
  "name": "UIResponder"
},{
  "id": 35,
  "typeString": "protocol",
  "name": "UIApplicationDelegate"
},{
  "id": 36,
  "typeString": "class",
  "name": "NSObject"
},{
  "id": 37,
  "typeString": "class",
  "name": "String"
},{
  "id": 38,
  "typeString": "protocol",
  "name": "Codable"
},{
  "id": 39,
  "typeString": "protocol",
  "name": "UITableViewDataSource"
},{
  "id": 40,
  "typeString": "protocol",
  "name": "UITableViewDelegate"
},{
  "id": 41,
  "typeString": "protocol",
  "name": "MCSessionDelegate"
},{
  "id": 42,
  "typeString": "protocol",
  "name": "MCBrowserViewControllerDelegate"
},{
  "id": 4,
  "typeString": "extension",
  "methods": [
    {
  "name": "hasActiveLeilao() -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didCreateLeilao(leilao: Leilao)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    2
  ]
},{
  "id": 7,
  "typeString": "extension",
  "methods": [
    {
  "name": "tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    39
  ]
},{
  "id": 8,
  "typeString": "extension",
  "methods": [
    {
  "name": "tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "prepare(for segue: UIStoryboardSegue, sender: Any?)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    40
  ]
},{
  "id": 9,
  "typeString": "extension",
  "methods": [
    {
  "name": "didChangeLeiloesData()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    5
  ]
},{
  "id": 12,
  "typeString": "extension",
  "methods": [
    {
  "name": "tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    39
  ]
},{
  "id": 13,
  "typeString": "extension",
  "methods": [
    {
  "name": "didChangeLeiloesData()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    5
  ]
},{
  "id": 15,
  "typeString": "extension",
  "methods": [
    {
  "name": "tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    39
  ]
},{
  "id": 16,
  "typeString": "extension",
  "methods": [
    {
  "name": "didChangeLeiloesData()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    5
  ]
},{
  "id": 20,
  "typeString": "extension",
  "methods": [
    {
  "name": "session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    41,
    42
  ]
},{
  "id": 21,
  "typeString": "extension",
  "methods": [
    {
  "name": "sendText(text: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getIsHost() -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "startHosting()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "joinSession() -> UIViewController",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
}] 