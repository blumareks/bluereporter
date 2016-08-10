//
//  ViewController.swift
//  AppWithWatsonSentiment
//
//  Created by Marek Sadowski on 3/10/16.
//  Copyright © 2016 Marek Sadowski. All rights reserved.
//

import UIKit
import WatsonDeveloperCloud

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textStatusLabel: UILabel!
    
    //Watson service init
    var alchemyApiInstance: AlchemyLanguage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkButtonPressed(sender: AnyObject) {
        NSLog(textField.text!)
        
        //checking sentiment
        
        //step 1: add instance by APIKEY
        if alchemyApiInstance == nil {
            alchemyApiInstance = AlchemyLanguage(apiKey: "<get the apiKey from the Bluemix - Watson - AlchemyApi services created for your account>")
        }
        
        //step 2: call the API
        NSLog("calling alchemy api")
        var textData = textField.text!
        alchemyApiInstance.getSentiment(requestType: AlchemyLanguageConstants.RequestType.Text,
            html: nil,
            url: nil,
            text: textData,
            sentimentType: AlchemyLanguageConstants.SentimentType.Normal)
            {   (error, entities) in
                //step 3: read the results

                self.textStatusLabel.text = "status " + (entities.docSentiment?.type!)!
                NSLog("status " + entities.docSentiment.debugDescription)
        }
        
        
        
        
    }

}

