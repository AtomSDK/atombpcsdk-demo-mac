//
//  VpnProtocolsService.swift
//  AtomBPC Demo OSX
//
//  Created by AtomBPC By Secure on 18/09/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation
import AtomCore
import AtomBPC

class VpnProtocolsService : VpnProtocolsServiceProtocol {
    
    func getProtocols(callBack: @escaping ([AtomProtocol]?, AtomException?) -> Void) {
        
        HelperMethods().appDelegate.bpcManager?.getProtocols(response: { (allProtocols, atomExceptions) in
                callBack(allProtocols , atomExceptions)
        })
    }
    
    
    func getProtocols(packageId: String, callBack: @escaping ([AtomProtocol]?, AtomException?) -> Void) {
        let packageObj = AtomPackages()
        packageObj.packageId = packageId
        HelperMethods().appDelegate.bpcManager?.getProtocolsByPackage(package: packageObj, response: { (allProtocols, atomException) in
            callBack(allProtocols , atomException)
        })
    }
}
