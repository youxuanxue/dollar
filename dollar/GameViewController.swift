//
//  GameViewController.swift
//  dollar
//
//  Created by xuej on 2017/11/16.
//  Copyright © 2017 yiyiyi. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

import SocketRocket

class GameViewController: UIViewController {

    let v = SRWebSocket.init()
//    let _webSocket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"ws://localhost:8086/v1/room/xx/xx"]]];

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = GameScene(size: view.frame.size)
        let skView = view  as! SKView
        skView.presentScene(scene)
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
}
