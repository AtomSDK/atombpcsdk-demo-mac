//
//  CountriesTableViewDataSource.swift
//  MacApp
//
//  Created by AtomBPC By Secure on 09/04/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Cocoa
import AtomCore

class ProtocolsTableViewDataSource: NSObject , NSTableViewDataSource , NSTableViewDelegate {
    
    var protocolsListingViewModel : ProtocolsListingViewModel!
    var protocolsListingCell = ConfigureProtocolsCell()
    var hideView = Dynamic(false)
    override init() {
        super.init()
        dependencyInitialization()
    }
    
    func dependencyInitialization() {
        let referenceContainer = (NSApplication.shared.delegate as! AppDelegate).dependencyContainer
        protocolsListingViewModel = referenceContainer.resolve(ProtocolsListingViewModel.self)
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.protocolsListingViewModel.protocolModel.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let cellIdentifier: String = "protocolsLisitingCell"
        
        if var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: cellIdentifier), owner: nil) as? NSTableCellView {
            let data = self.protocolsListingViewModel.protocolModel
            cell = protocolsListingCell.setupCell(atomProtocol:data[row] , cell : cell)
            return cell
        }
        return nil
    }
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        return CustomNSTableRowView()
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let notificationTable = notification.object as! NSTableView
        let selectedProtocol = self.protocolsListingViewModel.protocolModel[notificationTable.selectedRow]
        BaseViewModel.selectedProtocolSlug.value = selectedProtocol.protocol ?? ""
        print(selectedProtocol.protocol as Any)
        self.hideView.value = true
    }
}
