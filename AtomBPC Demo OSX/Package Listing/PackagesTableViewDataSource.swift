//
//  CountriesTableViewDataSource.swift
//  MacApp
//
//  Created by AtomBPC By Secure on 09/04/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Cocoa
import AtomCore

class PackagesTableViewDataSource: NSObject , NSTableViewDataSource , NSTableViewDelegate {
    
    var packageListingViewModel : PackagesListingViewModel!
    var packageListingCell = ConfigurePackagesCell()
    var hideView = Dynamic(false)
   
    override init() {
        super.init()
        dependencyInitialization()
    }
    
    func dependencyInitialization() {
        let referenceContainer = (NSApplication.shared.delegate as! AppDelegate).dependencyContainer
        packageListingViewModel = referenceContainer.resolve(PackagesListingViewModel.self)
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.packageListingViewModel.packagesModel.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let cellIdentifier: String = "packageLisitingCell"
        
        if var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: cellIdentifier), owner: nil) as? NSTableCellView {
            let data = self.packageListingViewModel.packagesModel
            cell = packageListingCell.setupCell(package:data[row] , cell : cell)
            return cell
        }
        return nil
    }
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        return CustomNSTableRowView()
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let notificationTable = notification.object as! NSTableView
        let selectedPkg = self.packageListingViewModel.packagesModel[notificationTable.selectedRow]
        BaseViewModel.selectedPackageId.value = selectedPkg.packageId
        BaseViewModel.selectedPackageName.value = selectedPkg.name ?? ""
        print(selectedPkg.name as Any)
        self.hideView.value = true
    }
}
