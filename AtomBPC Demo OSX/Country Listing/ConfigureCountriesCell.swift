//
//  ConfigureCountriesCell.swift
//  MacApp
//
//  Created by AtomBPC By Secure on 30/03/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Cocoa
import AtomCore
class ConfigureCountriesCell: NSTableCellView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    func setupCell(country : AtomCountry , cell : NSTableCellView) -> NSTableCellView {
        
        cell.textField?.stringValue = country.name ?? ""
        return cell
    }
    
}
