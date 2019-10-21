//
//  AppDelegate.swift
//  AtomBPC Demo OSX
//
//  Created by AtomBPC By Secure on 13/09/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Cocoa
import AtomBPC
import Swinject
import SwinjectAutoregistration

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let dependencyContainer = Container()
   
    func applicationDidFinishLaunching(_ aNotification: Notification) {
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func registerDependencies(){
        viewModelDependencies()
        uiDependencies()
    }
    
    func uiDependencies()  {
        dependencyContainer.autoregister(CountriesTableViewDataSource.self, initializer: CountriesTableViewDataSource.init).inObjectScope(.container)
        dependencyContainer.autoregister(ProtocolsTableViewDataSource.self, initializer: ProtocolsTableViewDataSource.init).inObjectScope(.container)
        dependencyContainer.autoregister(PackagesTableViewDataSource.self, initializer: PackagesTableViewDataSource.init).inObjectScope(.container)
    }
    
    func viewModelDependencies(){
        dependencyContainer.autoregister(AtomValidation.self, initializer: AtomValidation.init)
        dependencyContainer.autoregister(CountriesViewModel.self, initializer: CountriesViewModel.init).inObjectScope(.container)
        dependencyContainer.autoregister(ProtocolsListingViewModel.self, initializer: ProtocolsListingViewModel.init).inObjectScope(.container)
        dependencyContainer.autoregister(PackagesListingViewModel.self, initializer: PackagesListingViewModel.init).inObjectScope(.container)
        dependencyContainer.autoregister(MainViewModel.self, initializer: MainViewModel.init)
        dependencyContainer.autoregister(DashboardViewModel.self, initializer: DashboardViewModel.init)
    }

}

