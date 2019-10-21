//
//  ServerListingViewModel.swift
//  MacApp
//
//  Created by AtomBPC By Secure on 30/03/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation
import AtomCore
import AtomBPC

class ProtocolsListingViewModel : BaseViewModel {
    
    var protocolModel = [AtomProtocol]()
    var tempProtocolModel = [AtomProtocol]()
    var selectedProtocolModel :AtomProtocol? = nil
    var isAnimating = Dynamic(false)
    var isTblViewReload = Dynamic(false)
    
    override init() {
        super.init()
    }
    
    func getProtocols() {
        AtomBPCManager.sharedInstance()?.getProtocols(response: { (defaultProtocols, atomExceptions) in
               if let model = defaultProtocols {
                    self.protocolModel = model
                    self.protocolModel = self.protocolModel.sorted(by: { (Obj1, Obj2) -> Bool in
                        let Obj1_Name = Obj1.protocol ?? ""
                        let Obj2_Name = Obj2.protocol ?? ""
                        return (Obj1_Name.localizedCaseInsensitiveCompare(Obj2_Name) == .orderedAscending)
                    })
                    self.tempProtocolModel = self.protocolModel
                    self.isAnimating.value = false
                    self.isTblViewReload.value = true
                    BaseViewModel.selectedProtocolSlug.value = self.protocolModel.first?.protocol ?? "IPSEC"
                }
        })
    }
    
    func getProtocols(packageId : String)  {
        
        let packageObj = AtomPackages()
        packageObj.packageId = packageId
        AtomBPCManager.sharedInstance()?.getProtocolsByPackage(package: packageObj, response: { (packageProtocols, atomException) in
            if let model = packageProtocols {
                self.protocolModel = model
                self.protocolModel = self.protocolModel.sorted(by: { (Obj1, Obj2) -> Bool in
                    let Obj1_Name = Obj1.protocol ?? ""
                    let Obj2_Name = Obj2.protocol ?? ""
                    return (Obj1_Name.localizedCaseInsensitiveCompare(Obj2_Name) == .orderedAscending)
                })
                self.tempProtocolModel = self.protocolModel
                self.isAnimating.value = false
                self.isTblViewReload.value = true
            }
        })
    }
}
