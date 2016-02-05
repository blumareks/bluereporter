//
//  ViewController.swift
//  BlueReporter
//
//  Created by Marek Sadowski on 1/29/16.
//  Copyright © 2016 Marek Sadowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // step 1. UI text field
    @IBOutlet weak var blueReportText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // step 2. process the button is being pressed
    @IBAction func submitButtonPressed(sender: AnyObject) {
        NSLog("the Submit button was pressed")
        
        // step 3. show the contents of the UI text field
        NSLog(blueReportText.text!)
        
        // step 4. next exercise : connect to Cloudant and write this blueReport text down to DB
    }

}

