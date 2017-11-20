//
//  RoomViewController.swift
//  dollar
//
//  Created by xuej on 2017/11/16.
//  Copyright © 2017 yiyiyi. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

import  Starscream

class RoomViewController: UIViewController, WebSocketDelegate {

    var _webSocket: WebSocket?
    var roomId: Int64 = 1
    var uid: Int64 = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        connectWebSocket()

//        let scene = GameScene(size: view.frame.size)
//        let skView = view as! SKView
//        skView.presentScene(scene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidDisappear(_ animated: Bool) {
        cleanSocket()
        super.viewDidDisappear(animated)
    }

    // web socket
    func cleanSocket() {
        if (self._webSocket != nil) {
            print("cleaning...")
            self._webSocket!.disconnect()
            self._webSocket = nil
        }
    }

    func initSocket() {
        print("init...")
        let urlStr = String(format: "ws://localhost:8086/v1/room/%d/%d", self.roomId, self.uid)
        self._webSocket = WebSocket(url: URL(string: urlStr)!)
    }

    func connectWebSocket() {
        if (self._webSocket != nil) {
            print("connecting...")
            self._webSocket!.delegate = self
            self._webSocket!.connect()
        }
        else {
            initSocket()
            connectWebSocket()
        }
    }

    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("received text:", text)
    }

    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("received data:", data)
    }

    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("did close with error", error)
        connectWebSocket()
    }

    func websocketDidConnect(socket: WebSocketClient) {
        print("did opened.")
    }
}

