//
//  ConfigureCountriesCell.swift
//  MacApp
//
//  Created by AtomBPC By Secure on 30/03/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Cocoa
import AtomCore

class ConfigureProtocolsCell: NSTableCellView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    func setupCell(atomProtocol : AtomProtocol , cell : NSTableCellView) -> NSTableCellView {
        
        cell.textField?.stringValue = atomProtocol.protocol ?? ""
        return cell
    }
}

class CustomNSTableRowView: NSTableRowView {
    
    override func drawSelection(in dirtyRect: NSRect) {
        if self.selectionHighlightStyle != .none {
            let selectionRect = NSInsetRect(self.bounds, 2.5, 2.5)
            NSColor(calibratedWhite: 0.65, alpha: 1).setStroke()
            NSColor(calibratedWhite: 0.82, alpha: 1).setFill()
            let selectionPath = NSBezierPath.init(roundedRect: selectionRect, xRadius: 6, yRadius: 6)
            selectionPath.fill()
            selectionPath.stroke()
        }
    }
}
