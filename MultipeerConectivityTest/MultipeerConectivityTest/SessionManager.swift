
import MultipeerConnectivity
import ARKit

class SessionManager: NSObject{
    
    static let shared = SessionManager()
    
    var peerID: MCPeerID!
    var isHost: Bool = false
    var mcSession: MCSession!
    var mcAdvertierAssistant: MCAdvertiserAssistant!
    var listaLeilao: ListaLeilao!

    //Initializer access level change now
    
    
    private override init(){
        super.init()
        listaLeilao.listLeiloes = []
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
    
    func getListProdutos() -> ListaLeilao? {
        if listaLeilao != nil {
            return listaLeilao
        }
        return nil
    }

    //espera os dados que vieram e trata eles
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        if let text = String(bytes: data, encoding: .utf8) {
            let textArray = text.split(separator: Character("-"))
            if textArray[0] == "criarLeilao" {
                let leilao = Leilao.init(nome: String(textArray[1]), nomeLeiloeiro: String(textArray[2]), valorInicial: String(textArray[3]), valorAtual: String(textArray[4]))
                DispatchQueue.main.async {
                    self.listaLeilao.addLeilao(leilao: leilao)
                }
            } else if textArray[0] == "fecharLeilao" {
                
            } else if textArray [0] == "darLance" {
                
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

