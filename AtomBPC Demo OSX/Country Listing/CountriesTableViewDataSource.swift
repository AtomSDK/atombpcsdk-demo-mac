//
//  CountriesTableViewDataSource.swift
//  MacApp
//
//  Created by AtomBPC By Secure on 09/04/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Cocoa

class CountriesTableViewDataSource: NSObject , NSTableViewDataSource , NSTableViewDelegate {
    
    var countriesViewModel : CountriesViewModel!
    var countriesCell = ConfigureCountriesCell()
    var hideView = Dynamic(false)
    override init() {
        super.init()
        dependencyInitialization()
    }
    
    func dependencyInitialization() {
        let referenceContainer = (NSApplication.shared.delegate as! AppDelegate).dependencyContainer
        countriesViewModel = referenceContainer.resolve(CountriesViewModel.self)
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.countriesViewModel.countriesModel.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let cellIdentifier: String = "serverLisitingCell"
        
        if var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: cellIdentifier), owner: nil) as? NSTableCellView {
            let data = self.countriesViewModel.countriesModel
            cell = countriesCell.setupCell(country:data[row] , cell : cell)
            return cell
        }
        return nil
    }
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        return CustomNSTableRowView()
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let notificationTable = notification.object as! NSTableView
        let selectedCountry = self.countriesViewModel.countriesModel[notificationTable.selectedRow]
        BaseViewModel.selectedCountrySlug.value = selectedCountry.country ?? ""
        BaseViewModel.selectedCountryName.value = selectedCountry.name ?? ""
        print(selectedCountry.name as Any)
        self.hideView.value = true
    }
}
