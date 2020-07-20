//
//  SplashScreenViewController.swift
//  GoT
//
//  Created by Harsh Verma on 19/07/20.
//  Copyright © 2020 Harsh Verma. All rights reserved.
//

import UIKit
import AVFoundation

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var throneImgView: UIImageView!
    var audioPlayer: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(name: "GoT_theme")
        let yStart = throneImgView.frame.origin.y
        throneImgView.frame.origin.y = self.view.frame.height
        UIView.animate(withDuration: 1.0, delay: 1.0, animations: {self.throneImgView.frame.origin.y = yStart})
    }
    
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            }catch {
                print("Error: \(error.localizedDescription)")
            }
        }else {
            print("Error Grabing Audio")
        }
    }

    @IBAction func gestureBtn(_ sender: UITapGestureRecognizer) {
        if audioPlayer != nil {
            audioPlayer.stop()
        }
        performSegue(withIdentifier: "showTable", sender: nil)
    }
    
}
