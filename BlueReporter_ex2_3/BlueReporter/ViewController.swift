//
//  ViewController.swift
//  BlueReporter
//
//  Created by Marek Sadowski on 1/29/16.
//  Copyright © 2016 Marek Sadowski. All rights reserved.
//

import UIKit
import IBMMobileFirstPlatformFoundation

class ViewController: UIViewController, WLDelegate {
    
    // step 1. UI text field
    @IBOutlet weak var blueReportText: UITextField!
    var submitSuccess = false

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
        submitSuccess = false
        
        // step 4. connect to MFP 
        let wlClient = WLClient.sharedInstance()
        wlClient.wlConnectWithDelegate(self)
        
    }
    func onFailure(response: WLFailResponse!) {
        NSLog("Failed to connect to MFP")
        
    }
    func onSuccess(response: WLResponse!) {
        NSLog("Succeeded to connect to MFP")
        NSLog("trying to send the message to Cloudant")
        if(!submitSuccess) {
            submitSuccess = true
            var invocationData = WLProcedureInvocationData(adapterName: "ReportAdapter", procedureName: "postReport")
            
            var jsonObject: [String: AnyObject] = [
                "report": blueReportText.text! ,
                "report_module": "blumareks"
            ]
            
            invocationData.parameters = [jsonObject]
            let mfpClient = WLClient.sharedInstance()
            mfpClient.invokeProcedure(invocationData, withDelegate: self)
        }
        
    }
}

