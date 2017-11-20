//
// Created by xuej on 2017/11/20.
// Copyright (c) 2017 yiyiyi. All rights reserved.
//

import UIKit

class RoomGetOrCreateViewController: UIViewController {

    let roomViewController = RoomViewController()

    @IBOutlet var imageView: UIImageView!
    let viewTransitionDelegate = TransitionDelegate()



    override var preferredContentSize: CGSize {
        return super.preferredContentSize
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController = segue.destinationViewController as! DetailViewController
        destinationViewController.imageToDisplay = imageView.image
        destinationViewController.transitioningDelegate = viewTransitionDelegate
        destinationViewController.modalPresentationStyle = .Custom
    }
}

