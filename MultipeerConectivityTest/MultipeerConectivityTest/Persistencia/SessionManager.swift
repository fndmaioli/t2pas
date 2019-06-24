
import MultipeerConnectivity
import ARKit

class SessionManager: NSObject{
    
    static let shared = SessionManager()
    
    var peerID: MCPeerID!
    var isHost: Bool = false
    var mcSession: MCSession!
    var mcAdvertierAssistant: MCAdvertiserAssistant!
//    var listaLeilao: ListaLeilao = ListaLeilao.shared
    var updateLeiloesDelegate: updateLeiloesListDelegate?
    var createLeilaoDelegate: CreateLeilaoDelegate?

    //Initializer access level change now
    
    
    private override init(){
        super.init()
//        listaLeilao.listLeiloes = []
        peerID = MCPeerID(displayName: UIDevice.current.name)
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        mcSession.delegate = self
        
    }
    
}

extension SessionManager: MCSessionDelegate, MCBrowserViewControllerDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
        switch state {
        case MCSessionState.connected:
            print("Connected: \(peerID.displayName)")
            
        case MCSessionState.connecting:
            print("Connecting: \(peerID.displayName)")
            
        case MCSessionState.notConnected:
            print("Not Connected: \(peerID.displayName)")
            
        default:
            print("Default")
        }
    }

//    func getListProdutos() -> ListaLeilao? {
//        if listaLeilao != nil {
//            return listaLeilao
//        }
//        return nil
//    }

    //espera os dados que vieram e trata eles
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        if let text = String(bytes: data, encoding: .utf8) {
            let textArray = text.split(separator: Character("-"))
            if textArray[0] == "criarLeilao" {
                // "criarLeilao-idLeilao-nomeProduto-nomeLeiloeiro-valorInicial-valorAtual"
                let leilao = Leilao.init(idLeilao: String(textArray[1]), nome: String(textArray[2]), nomeLeiloeiro: String(textArray[3]), valorInicial: String(textArray[4]))
//                ListaLeilao.shared.addLeilao(leilao: leilao)
                ListaLeilao.shared.addLeilao(leilao: leilao)
                ListaLeilaoAdmin.shared.addLeilao(leilao: leilao)
                self.updateLeiloesDelegate?.didChangeLeiloesData()
            } else if textArray[0] == "fecharLeilao" {
                // "fecharLeilao-idLeilao"
                ListaLeilao.shared.removeLeilao(leilaoId: String(textArray[1]))
                self.updateLeiloesDelegate?.didChangeLeiloesData()
                
            } else if textArray [0] == "darLance" {
                // "darLance-idLeilao-valorLance"
                var leilao = ListaLeilao.shared.searchLeilaoById(id: String(textArray[1]))
                leilao?.valorAtual = String(textArray[2])
                FacadeListaLeilao().alteraValorAtual(valor: String(textArray[2]), id: String(textArray[1]))
                self.updateLeiloesDelegate?.didChangeLeiloesData()
                self.createLeilaoDelegate?.didCreateLeilao(leilao: leilao!)
            }
        }
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
//        let storyboard = UIStoryboard(name: "Main", bundle: .main)
//        let gameScreen = storyboard.instantiateViewController(withIdentifier: "gameScreen") as! ViewController
//        browserViewController.present(gameScreen, animated: true, completion: nil)
        browserViewController.dismiss(animated: true, completion: nil)

    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        browserViewController.dismiss(animated: true, completion: nil)
    }
}

extension SessionManager {
    
    func sendText(text: String) {
        if mcSession.connectedPeers.count > 0 {
            if let textData = text.data(using: .utf8) {
                do {
                    try mcSession.send(textData, toPeers: mcSession.connectedPeers, with: .reliable)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getIsHost() -> Bool {
        return isHost
    }
    
    func startHosting() {
        mcAdvertierAssistant = MCAdvertiserAssistant(serviceType: "hws-kb", discoveryInfo: nil, session: mcSession)
        self.isHost = true
        mcAdvertierAssistant.start()
    }
    
    func joinSession() -> UIViewController {
        let mcBrowser = MCBrowserViewController(serviceType: "hws-kb", session: mcSession)
        mcBrowser.delegate = self
        return mcBrowser
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        sendText(text: textField.text!)
        return true
    }
}

