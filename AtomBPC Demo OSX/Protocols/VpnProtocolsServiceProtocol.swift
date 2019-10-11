//
//  VpnProtocolsServiceProtocol.swift
//  AtomBPC Demo OSX
//
//  Created by AtomBPC By Secure on 18/09/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation
import AtomCore
import AtomBPC

protocol VpnProtocolsServiceProtocol {
    func getProtocols(callBack:@escaping ([AtomProtocol]? ,AtomException?) -> Void)
    func getProtocols(packageId : String  , callBack:@escaping ([AtomProtocol]? ,AtomException?) -> Void)
    
}
