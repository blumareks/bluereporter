//
//  ViewController.swift
//  WatsonTTS
//
//  Created by Marek Sadowski on 4/5/16.
//  Copyright © 2016 Marek Sadowski. All rights reserved.
//

import UIKit

//adding Watson Text to Speech
import WatsonDeveloperCloud

//adding AVFoundation
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var speakText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func speakButtonPressed(sender: AnyObject) {
        NSLog("speak button pressed, text to say: " + speakText.text!)
        
        //adding Watson service
        let service = TextToSpeech(username: "<add username>", password: "<add password>")
        service.synthesize(speakText.text!)
        {(data, error) in
            do {
                let audioPlayer = try AVAudioPlayer(data: data!)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                sleep(10)
            } catch {
                NSLog("something went terribly wrong")
            }
        }
      
    }

}

