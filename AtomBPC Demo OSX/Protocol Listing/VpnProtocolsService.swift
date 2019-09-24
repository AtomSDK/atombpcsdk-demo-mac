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
    
    func getProtocols(callBack: @escaping ([AtomProtocol]?, BPCException?) -> Void) {
        
        HelperMethods().appDelegate.bpcManager?.getProtocols(response: { (allProtocols, bpcExceptions) in
                callBack(allProtocols , bpcExceptions)
        })
    }
    
    
    func getProtocols(packageId: String, callBack: @escaping ([AtomProtocol]?, BPCException?) -> Void) {
        
        HelperMethods().appDelegate.bpcManager?.getProtocolsByPackage(packageId: packageId, response: { (allProtocols, bpcException) in
            callBack(allProtocols , bpcException)
        })
    }
}
