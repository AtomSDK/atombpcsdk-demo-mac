//
//  PackagesService.swift
//  AtomBPC Demo OSX
//
//  Created by AtomBPC By Secure on 18/09/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation
import AtomCore
import AtomBPC

class PackagesService : PackagesServiceProtocol {

    func getPackages(callBack: @escaping ([AtomPackages]?, BPCException?) -> Void) {
        HelperMethods().appDelegate.bpcManager?.getPackages(response: { (allpackages, bpcException) in
            callBack(allpackages , bpcException)
        })
    }
}
