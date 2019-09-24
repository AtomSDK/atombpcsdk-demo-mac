//
//  MainViewModel.swift
//  AtomBPC Demo OSX
//
//  Created by AtomBPC By Secure on 20/09/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation

class MainViewModel :BaseViewModel {
    
    private  var atomValidation :AtomValidation!
    var atomValidationStatus = Dynamic(false)
    var atomValidationMessage = Dynamic(String())
    
    override init() {
        super.init()
        self.resolveDependencies()
    }
    
    private func resolveDependencies() {
        
        atomValidation = referenceContainer.resolve(AtomValidation.self)
    }
    
    func validateAtomWithSecretKey(secretKey : String)  {
        
        if secretKey == "" {
            self.atomValidationMessage.value = "Provide SecretKey"
        }
        else{
            atomValidation.validate(secretKey: secretKey)
            self.atomValidationStatus.value = true
        }
    }
}
