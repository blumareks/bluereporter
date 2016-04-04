//
//  ViewController.swift
//  WatsonVisualApp
//
//  Created by Marek Sadowski on 4/2/16.
//  Copyright © 2016 Marek Sadowski. All rights reserved.
//

import UIKit
import WatsonDeveloperCloud

class ViewController: UIViewController {
    @IBOutlet weak var urlText: UITextField!
    @IBOutlet weak var analysisTextLabel: UILabel!
    let alchemyVisionInstance = AlchemyVision(apiKey: "<api key goes here>") //please get your Watson API key from Bluemix.net
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func analysisButtonPressed(sender: AnyObject) {
        NSLog("button pressed")
        NSLog("url: "+urlText.text!)
        NSLog("status " + urlText.text!)
        
        //call service
        alchemyVisionInstance.getImageKeywords(VisionConstants.ImageKeywordType.URL,
                                               stringURL: urlText.text!,
                                               image: nil,
                                               forceShowAll: true,
                                               knowledgeGraph: 0)
        { (imageKeyWords,error) in
            NSLog("status from Watson Service " + imageKeyWords.debugDescription)
            //get output
            self.analysisTextLabel.text = imageKeyWords.debugDescription
        }
    }

}

