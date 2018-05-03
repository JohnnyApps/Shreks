//
//  BlackViewController.swift
//  Shreks
//
//  Created by Jan Smolinski on 02/05/2018.
//  Copyright © 2018 Jan Smolinski. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class BlackViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    var timer = Timer()
    var seconds = 11
    var text = ""
    var data = NSData()
    
    
    @objc func Clock() {
        seconds = seconds-1
        TimeLabel.text = String(seconds)
        if seconds == 0 {
            timer.invalidate()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "holding12", ofType: ".mp3")!
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        
        audioPlayer.play()
        
        if seconds > 0 {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(BlackViewController.Clock), userInfo: nil, repeats: true)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 11, execute: {
            let storyBoardd : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let gameView = storyBoardd.instantiateViewController(withIdentifier: "GameVC") as! GameViewController
            gameView.modalTransitionStyle = .crossDissolve
            self.present(gameView, animated:true, completion:nil)
        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
