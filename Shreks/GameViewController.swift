//
//  GameViewController.swift
//  Shreks
//
//  Created by Jan Smolinski on 02/05/2018.
//  Copyright © 2018 Jan Smolinski. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class GameViewController: UIViewController {
    
    @IBOutlet weak var fairyLabel: UILabel!
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var godmother: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    
    
    var fairy1 = "welcome to beautiful fairy godmother world"
    var fairy2 = "here everyone is nice and you can find h a p p i n e s s and p e a c e"
    var fairy3 = "oh no is this s h r e k?!"
    var fairy4 = "fiona, fight him!!!!"
    
    var timer = Timer()
    var seconds = 11
    
    
    var audioPlayer: AVAudioPlayer!
    
    var activePlayer = 1 //cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func action(_ sender: Any) {
        if gameState[(sender as AnyObject).tag-1] == 0 && gameIsActive == true {
            
            gameState[(sender as AnyObject).tag-1] = activePlayer
        
        if activePlayer == 1 {
            (sender as AnyObject).setImage(UIImage(named: "shrekk.jpg")!, for: .normal)
            activePlayer = 2
        } else {
            (sender as AnyObject).setImage(UIImage(named: "fiona.jpg")!, for: .normal)
            activePlayer = 1
        }
    }
        
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                gameIsActive = false
                
                if gameState[combination[0]] == 1 {
                    // shrek has won
                    print("SHREK")
                    label.text = "SHREK HAS WON!"
                    
                } else {
                    // fiona has won
                    print("FIONA")
                    label.text = "FIONA HAS WON!"
                    
                }
                
                playAgainButton.isHidden = false
                label.isHidden = false
                
                image1.isHidden = true
                image2.isHidden = true
                image3.isHidden = true
                image4.isHidden = true
                audioPlayer.pause()
                
                
            }
        }
        
        gameIsActive = false
        
        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false {
            label.text = "DONKEY WON HEHEHEH"
            label.isHidden = false
            playAgainButton.isHidden = false
            audioPlayer.pause()
            image1.isHidden = true
            image2.isHidden = true
            image3.isHidden = true
            image4.isHidden = true
            
            
        }
        
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        image1.isHidden = false
        image2.isHidden = false
        image3.isHidden = false
        image4.isHidden = false
        audioPlayer.play()
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fairyLabel.text = fairy1
        
        let path = Bundle.main.path(forResource: "holding22", ofType: ".mp3")!
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        
        audioPlayer.play()
        
        playAgainButton.layer.cornerRadius = 6
        playAgainButton.layer.shadowColor = UIColor.darkGray.cgColor
        playAgainButton.layer.borderWidth = 3
        playAgainButton.layer.borderColor = UIColor.black.cgColor
        playAgainButton.backgroundColor = .green
        playAgainButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        playAgainButton.layer.masksToBounds = false
        playAgainButton.layer.shadowRadius = 4
        playAgainButton.layer.shadowOpacity = 0.5
        playAgainButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        playButton.layer.cornerRadius = 6
        playButton.layer.shadowColor = UIColor.darkGray.cgColor
        playButton.layer.borderWidth = 3
        playButton.layer.borderColor = UIColor.green.cgColor
        playButton.backgroundColor = .black
        playButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        playButton.layer.masksToBounds = false
        playButton.layer.shadowRadius = 4
        playButton.layer.shadowOpacity = 0.5
        playButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        image1.layer.masksToBounds = true
        image2.layer.masksToBounds = true
        image3.layer.masksToBounds = true
        image4.layer.masksToBounds = true
        image1.layer.cornerRadius = 3
        image2.layer.cornerRadius = 3
        image3.layer.cornerRadius = 3
        image4.layer.cornerRadius = 3
        godmother.layer.masksToBounds = true
        godmother.clipsToBounds = true
        godmother.layer.cornerRadius = 4
        godmother.layer.shadowColor = UIColor.darkGray.cgColor
        godmother.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        godmother.layer.masksToBounds = false
        godmother.layer.shadowRadius = 4
        godmother.layer.shadowOpacity = 0.5
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func Random() -> String {
        let numberOfImages: UInt32 = 7
        let random = arc4random_uniform(numberOfImages)
        let imageName = "random\(random)"
        return imageName
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        audioPlayer.stop()
        timer.invalidate()
        let storyBoardd : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let mainView = storyBoardd.instantiateViewController(withIdentifier: "MainVC") as! ViewController
        mainView.modalTransitionStyle = .flipHorizontal
        self.present(mainView, animated:true, completion:nil)
        
    }
    
    
    @IBAction func Tap(_ sender: Any) {
        
        
        
        if fairyLabel.text == fairy1 {
            fairyLabel.text = fairy2
        } else if fairyLabel.text == fairy2 {
            fairyLabel.text = fairy3
            godmother.image = #imageLiteral(resourceName: "mother1")
        } else if fairyLabel.text == fairy3 {
            fairyLabel.text = fairy4
            godmother.image = #imageLiteral(resourceName: "mother2")
            playButton.isHidden = false
            tapButton.isHidden = true
            
        }
    }
    
    @IBAction func Play(_ sender: Any) {
        playButton.isHidden = true
        godmother.isHidden = true
        fairyLabel.isHidden = true
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(BlackViewController.Clock), userInfo: nil, repeats: true)
    }
    
    @objc func Clock() {
        image1.image = UIImage(named: Random())
        image2.image = UIImage(named: Random())
        image3.image = UIImage(named: Random())
        image4.image = UIImage(named: Random())
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
