//
//  CredentialsViewController.swift
//  AtomBPC Demo OSX
//
//  Created by AtomBPC By Secure on 20/09/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Cocoa

class CredentialsViewController: BaseViewController {
    
    @IBOutlet weak var btnProceed: NSButton!
    @IBOutlet weak var txtFieldSecretKey: NSTextField!
    @IBOutlet weak var txtFieldUUID: NSTextField!
    @IBOutlet weak var txtFieldVpnPassword: NSTextField!
    @IBOutlet weak var txtFieldVpnUserName: NSTextField!
    var updateView  = Dynamic(true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear() {
        updateUI()
    }

    func updateUI(){
        self.txtFieldSecretKey.stringValue = BaseViewModel.secretKey.value
        self.updateView.bind { (status) in
            DispatchQueue.main.async {
                self.performCustomSegue(identifier: Constants.customSegueIdentifiers.dashboardViewSegue)
            }
        }
    }
    
    @IBAction func btnProceed(_ sender: NSButton) {
       
        var proceed = false
        
        if(self.txtFieldVpnUserName.stringValue != "" && self.txtFieldVpnPassword.stringValue != ""){
            BaseViewModel.credential_vpnUserName.value = self.txtFieldVpnUserName.stringValue
            BaseViewModel.credential_vpnPassword.value = self.txtFieldVpnPassword.stringValue
            proceed = true
        }
        else if(self.txtFieldUUID.stringValue != ""){
            BaseViewModel.credential_uuid.value = self.txtFieldUUID.stringValue
            proceed = true
        }
        else{
            print("Please Provide vpn username and password or UUID ")
        }
        
        if proceed {
            self.txtFieldVpnUserName.isEnabled = false
            self.txtFieldVpnUserName.isEditable = false
            self.txtFieldVpnPassword.isEnabled = false
            self.txtFieldVpnPassword.isEditable = false
            self.txtFieldUUID.isEnabled = false
            self.txtFieldUUID.isEditable = false
            self.btnProceed.isEnabled = false
            self.updateView.value = proceed
        }
    }
}
