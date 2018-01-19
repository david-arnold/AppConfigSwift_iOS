//
//  ViewController.swift
//  AppConfigSwift
//
//  Created by David Arnold on 19/01/2018.
//  Copyright © 2018 David Arnold. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var serverURL: UITextField!
    @IBOutlet var enableHTTPS: UISwitch!
    @IBOutlet var username: UITextField!
    @IBOutlet var userEmailAddress: UITextField!
    @IBOutlet var otherVariable: UITextField!
    
    let kConfigurationKey = "com.apple.configuration.managed";
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(userDefaultsChanged(notification:)),
            name: UserDefaults.didChangeNotification,
            object: nil
        );

        readUserDefaults();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func userDefaultsChanged(notification:Notification){
        readUserDefaults();
    }
    
    func readUserDefaults() -> Void {
        let managedAppConfig:Dictionary = UserDefaults.standard.dictionary(forKey: kConfigurationKey)!;
        
        let serverURLString:String = managedAppConfig["serverURL"] as! String;
        let enableHTTPSBoolean:Bool = managedAppConfig["enableHTTPS"] as! Bool;
        let usernameString:String = managedAppConfig["username"] as! String;
        let userEmailAddressString:String = managedAppConfig["userEmailAddress"] as! String;
        let otherVariableString:String = managedAppConfig["otherVariable"] as! String;
        
        //validation ?
        
        serverURL.text = serverURLString;
        username.text = usernameString;
        userEmailAddress.text = userEmailAddressString;
        otherVariable.text = otherVariableString;
        enableHTTPS.setOn(enableHTTPSBoolean, animated: false);
        
        
    }


}

