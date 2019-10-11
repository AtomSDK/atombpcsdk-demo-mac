//
//  PackagesServiceProtocol.swift
//  AtomBPC Demo OSX
//
//  Created by AtomBPC By Secure on 18/09/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation
import AtomBPC
import AtomCore

protocol PackagesServiceProtocol {
    
   func getPackages(callBack:@escaping ([AtomPackages]? ,AtomException?) -> Void)
}
