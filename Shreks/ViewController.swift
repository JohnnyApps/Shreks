//
//  ViewController.swift
//  Shreks
//
//  Created by Jan Smolinski on 23/02/2018.
//  Copyright © 2018 Jan Smolinski. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import Darwin

class ViewController: UIViewController, UITextFieldDelegate {
    
    var shrekTimer: Timer!
    
    var audioPlayer: AVAudioPlayer!
    
    
    
    
    
    @IBOutlet weak var shrekSwitch: UISegmentedControl!
    
    
    @IBOutlet weak var shrekBackground: UIImageView!
    @IBOutlet weak var shrekField: UITextField!
    @IBOutlet weak var shrekLabel: UILabel!
    @IBOutlet weak var shrekImage: UIImageView!
    var usyheijduy = ["hello", "ddhhfs", "efefefef", "goodf", "coolaff", "sososo"]
    @IBOutlet weak var shrekLogo: UIImageView!
    @IBOutlet weak var shrekButton: UIButton!
    @IBOutlet var playAllStar: UIScreenEdgePanGestureRecognizer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        shrekLabel.alpha = 1
        shrekField.layer.cornerRadius = 4
        
        //BUTTON CONFIG
        shrekButton.layer.cornerRadius = shrekButton.frame.height / 2
        shrekButton.layer.shadowColor = UIColor.darkGray.cgColor
        shrekButton.layer.borderWidth = 2
        shrekButton.layer.borderColor = UIColor.black.cgColor
        shrekButton.backgroundColor = .green
        shrekButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        shrekButton.layer.masksToBounds = false
        shrekButton.layer.shadowRadius = 4
        shrekButton.layer.shadowOpacity = 0.5
        shrekButton.titleLabel?.adjustsFontSizeToFitWidth = true
        shrekLabel.layer.cornerRadius = 5
        shrekLabel.adjustsFontSizeToFitWidth = true
        
        shrekSwitch.layer.cornerRadius = 4
        shrekSwitch.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        shrekSwitch.layer.masksToBounds = false
        shrekSwitch.layer.shadowRadius = 4
        shrekSwitch.layer.shadowOpacity = 0.5
        shrekSwitch.layer.shadowColor = UIColor.darkGray.cgColor
        shrekImage.image = #imageLiteral(resourceName: "shrek")
        
        shrekLogo.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        shrekLogo.layer.masksToBounds = false
        shrekLogo.layer.shadowRadius = 4
        shrekLogo.layer.shadowOpacity = 0.5
        shrekLogo.layer.shadowColor = UIColor.green.cgColor
        
        shrekField.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        shrekField.layer.masksToBounds = false
        shrekField.layer.shadowRadius = 4
        shrekField.layer.shadowOpacity = 0.3
        shrekField.adjustsFontSizeToFitWidth = true
        shrekField.layer.shadowColor = UIColor.lightGray.cgColor

        
        self.shrekField.delegate = self
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    func Convert() -> Double {
        
        if shrekSwitch.selectedSegmentIndex == 0 {
            let value = shrekField.text
            let minutes = Double(value!)
            let sminutes = minutes!/95
            return sminutes
        } else {
            let value = shrekField.text
            let hours = Double(value!)
            let shours = hours! * 60 / 95
            return shours
        }
        
    }
    
    func Play(song:String) {
        let path = Bundle.main.path(forResource: song, ofType: ".mp3")!
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        
        audioPlayer.play()
        
        
    }

    @IBAction func getShreked(_ sender: Any) {
        
        UIView.animate(withDuration: 0,
                       animations: {
                        self.shrekButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.3) {
                            self.shrekButton.transform = CGAffineTransform.identity
                        }
        })
        
        func animateSomething() -> String {
            let shhshh = 598*5+usyheijduy.count/2-1
            let hello = Double.pi
            let fionahehe = hello*4152550.637
            let alrigtht = 1+1*0+1-2
            let rickastley = Double(shhshh)+fionahehe+Double(alrigtht)+3*10000
            let nickiminaj = Int(ceil(rickastley-6613.574859))
            let nevergonnagiveyouup = String(nickiminaj)
            return nevergonnagiveyouup
        }
        
        if shrekField.text?.isEmpty == true {
            print("error")
            shrekBackground.image = #imageLiteral(resourceName: "angryshrek")
            shrekBackground.contentMode = .scaleAspectFill
            shrekLabel.alpha = 0
            shrekImage.alpha = 0
            
        } else if shrekField.text == animateSomething() {
            
            
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let blackView = storyBoard.instantiateViewController(withIdentifier: "BlackVC")
            blackView.modalTransitionStyle = .crossDissolve
            self.present(blackView, animated:true, completion:nil)
            
            
            
            
        } else {
        shrekLabel.text = String(format: "%.2f", Convert()) + "Sh"
            shrekImage.image = #imageLiteral(resourceName: "shrek2")
            shrekImage.contentMode = .scaleAspectFill
            shrekBackground.image = #imageLiteral(resourceName: "background")
            shrekBackground.contentMode = .scaleAspectFill
            shrekLabel.alpha = 1
            shrekImage.alpha = 1
        }
        
    }
    
    // PARTYYYYY
    @IBAction func PlayAllStar(_ sender: Any) {
        
        Play(song: "allstar")
        
        print("sjibiwqejbfi")
        shrekImage.transform = CGAffineTransform(scaleX: 20, y: 20)
        
        
        shrekTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(LabelCreate), userInfo: nil, repeats: true)
    }
    
    @objc func LabelCreate() {
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        let myLabel = UILabel()
        let randomx = Int(arc4random_uniform(UInt32(screenSize.width)))
        let randomy = Int(arc4random_uniform(UInt32(screenSize.height)))
        let scale = CGFloat(arc4random_uniform(5))
        let rotate = arc4random_uniform(50)
        
        myLabel.text = "shreked"
        myLabel.textColor = .black
        myLabel.textAlignment = .center
        
        myLabel.frame = CGRect(x: randomx, y: randomy, width: Int(screenSize.width * 0.2), height: Int(screenSize.height * 0.2))
        view.addSubview(myLabel)
        
        let myImage = UIImageView()
        myImage.image = #imageLiteral(resourceName: "shrek")
        myImage.frame = CGRect(x: randomx, y: randomy, width: Int(screenSize.width * 0.2), height: Int(screenSize.height * 0.2))
        myImage.transform = myImage.transform.scaledBy(x: scale, y: scale)
        myImage.transform = myImage.transform.rotated(by: CGFloat(rotate))
        view.addSubview(myImage)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        shrekField.resignFirstResponder()
        return (true)
    }
    
    @IBAction func info(_ sender: Any) {
        print("ok")
        let alert = UIAlertController(title: "FUN", message: "This app was created for FUN. The idea is from an Instagram account called @shrekbae <-- go and follow him :pp", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
                
                
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func changeShrek(_ sender: Any) {
        
        if shrekImage.image == #imageLiteral(resourceName: "shrek") {
            shrekImage.image = #imageLiteral(resourceName: "shrek2")
        } else {
            shrekImage.image = #imageLiteral(resourceName: "shrek")
        }
        
    }
    
    
    
    
}

