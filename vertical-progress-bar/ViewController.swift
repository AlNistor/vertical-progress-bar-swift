//
//  ViewController.swift
//  vertical-progress-bar
//
//  Created by Alexandru Nistor on 11/10/16.
//  Copyright © 2016 ASSIST. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var progressBarView: ProgressBarView!
    
    // MARK: - Overriden Methods
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // On iOS 10 it has some strange behaviour if you put this in viewDidLoad. I found that in view didAppear it works without problems.
        progressBarView.initBar()
        
        // The level of progress can be set from any point in the program.
        progressBarView.setProgressValue(90)
        
        delayAction(withTime: 2.0) { () in
            self.progressBarView.setProgressValue(10)
            
            delayAction(withTime: 2.0) { () in
                self.progressBarView.setProgressValue(70)
                
                delayAction(withTime: 2.0) { () in
                    self.progressBarView.setProgressValue(100)
                }
            }
        }
    }
}

/**
 General delay action time with completion handler.
 - Parameter _time : Double value that represents the seconds after which the function will execute the completion handler.
 - Parameter done : Function that receives void and returns void.
 */
func delayAction(withTime _time: Double, done: Void -> Void){
    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(_time * Double(NSEC_PER_SEC)))
    dispatch_after(delayTime, dispatch_get_main_queue()) {
        done()
    }
}

