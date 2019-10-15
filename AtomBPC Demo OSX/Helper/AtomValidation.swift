//
//  Created by AtomBPC By Secure on 3/7/19.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation
import AtomCore
import AtomBPC
import AtomSDK

class AtomValidation {
    
    let atomConfig = AtomConfiguration()
    
    func validate(secretKey:String){
        
        self.setupAtomBPCSDK(secretKey: secretKey)
        self.setupAtomSDK(secretKey: secretKey)
    }
    
    private func setupAtomSDK(secretKey : String){
        atomConfig.secretKey = secretKey;
        atomConfig.vpnInterfaceName = "AtomBPCDemoApp";
        AtomManager.sharedInstance(with: atomConfig)
    }
    
    private func setupAtomBPCSDK(secretKey : String) {
        atomConfig.secretKey = secretKey;
        HelperMethods().appDelegate.bpcManager = AtomBPCManager.sharedInstanceWith(atomConfiguration: atomConfig)
    }
}
