//
//  ViewController.swift
//
//  Created by AtomBPC By Secure on 06/08/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Cocoa

class MainViewController: BaseViewController {
    
    
    @IBOutlet weak var btnInitialize: NSButton!
    @IBOutlet weak var txtFieldSecretKey: NSTextField!
    var mainViewModel :MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resolveDependencies()
    }
    
    override func viewWillAppear() {
        updateUI()
    }
    private func resolveDependencies() {
        mainViewModel = referenceContainer.resolve(MainViewModel.self)
    }
    
    func updateUI() {
        
        mainViewModel.atomValidationStatus.bind { (status) in
            DispatchQueue.main.async {
                self.txtFieldSecretKey.isSelectable = false
                self.btnInitialize.isEnabled = false
                self.performCustomSegue(identifier: Constants.customSegueIdentifiers.credentialSegue)
            }
        }
        
        mainViewModel.atomValidationMessage.bind { (message) in
            print(message as Any)
        }
    }
    
    
    @IBAction func btnInitialize(_ sender: NSButton) {
        BaseViewModel.secretKey.value = self.txtFieldSecretKey.stringValue
        self.mainViewModel.validateAtomWithSecretKey(secretKey: self.txtFieldSecretKey.stringValue)
    }
    
    override var representedObject: Any? {
        didSet {
        }
    }
}

