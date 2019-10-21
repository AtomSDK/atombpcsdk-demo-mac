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
class PackagesListingViewModel : BaseViewModel {
    
    var packagesModel = [AtomPackages]()
    var selectedCountryModel :AtomPackages? = nil
    var isAnimating = Dynamic(false)
    var isTblViewReload = Dynamic(false)
    
    override init() {
        super.init()
    }
    
    func getPackages()  {
        DispatchQueue.main.async{
            self.isAnimating.value = true
          
            AtomBPCManager.sharedInstance()?.getPackages(response: { (packagesModel, atomException) in
              if let model = packagesModel {
                    self.packagesModel = model
                    self.packagesModel = self.packagesModel.sorted(by: { (Obj1, Obj2) -> Bool in
                        let Obj1_Name = Obj1.name ?? ""
                        let Obj2_Name = Obj2.name ?? ""
                        return (Obj1_Name.localizedCaseInsensitiveCompare(Obj2_Name) == .orderedAscending)
                    })
                    self.isAnimating.value = false
                    self.isTblViewReload.value = true
                }
            })
        }
    }
}
