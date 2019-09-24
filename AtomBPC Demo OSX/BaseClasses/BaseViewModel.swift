//
//  BaseViewModel.swift
//  Presentation
//
//  Created by AtomBPC By Secure on 3/21/19.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation
import AppKit

class BaseViewModel: NSObject {
    
    let referenceContainer = (NSApplication.shared.delegate as! AppDelegate).dependencyContainer
    
    static var secretKey = Dynamic(String())
    static var credential_uuid = Dynamic(String())
    static var credential_vpnUserName = Dynamic(String())
    static var credential_vpnPassword = Dynamic(String())
    
    static var selectedPackageId = Dynamic(String())
    static var selectedPackageName = Dynamic(String())
    static var selectedProtocolSlug = Dynamic(String())
    static var selectedCountrySlug = Dynamic(String())
    static var selectedCountryName = Dynamic(String())
    static var vpnCurrentStatus = ""
}
