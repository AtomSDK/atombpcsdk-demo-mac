//
//  BaseViewController.swift
//  Presentation
//
//  Created by AtomBPC By Secure on 3/22/19.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Cocoa
import AppKit

class BaseViewController: NSViewController {

    let referenceContainer = (NSApplication.shared.delegate as! AppDelegate).dependencyContainer
    let appDelegate = NSApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
       
        super.viewDidLoad()
        self.appDelegate.registerDependencies()
        performCustomSegue(identifier: Constants.customSegueIdentifiers.loginViewSegue)
        
    }
    
    func performCustomSegue(identifier:String){
        performSegue(withIdentifier: identifier, sender: self)
    }
    
    func getIndicator (view:NSView) -> NSProgressIndicator{
        let progress = NSProgressIndicator(frame: NSRect(x: view.frame.width/2-15, y: view.frame.height/2-15, width: 30, height: 30))
        progress.style = .spinning
        progress.set(tintColor: .white)
        return progress
    }
    
    func stopIndicator(progress:NSProgressIndicator ,onView:NSView){
        progress.stopAnimation(nil)
        progress.isHidden = false
        progress.removeFromSuperview()
    }
    
    func startIndicator(progress:NSProgressIndicator ,onView:NSView){
        progress.startAnimation(nil)
        onView.addSubview(progress)
    }
}

extension NSProgressIndicator {
    
    func set(tintColor: NSColor) {
        guard let adjustedTintColor = tintColor.usingColorSpace(.deviceRGB) else {
            contentFilters = []
            
            return
        }
        
        let tintColorRedComponent = adjustedTintColor.redComponent
        let tintColorGreenComponent = adjustedTintColor.greenComponent
        let tintColorBlueComponent = adjustedTintColor.blueComponent
        
        let tintColorMinComponentsVector = CIVector(x: tintColorRedComponent, y: tintColorGreenComponent, z: tintColorBlueComponent, w: 0.0)
        let tintColorMaxComponentsVector = CIVector(x: tintColorRedComponent, y: tintColorGreenComponent, z: tintColorBlueComponent, w: 1.0)
        
        let colorClampFilter = CIFilter(name: "CIColorClamp")!
        colorClampFilter.setDefaults()
        colorClampFilter.setValue(tintColorMinComponentsVector, forKey: "inputMinComponents")
        colorClampFilter.setValue(tintColorMaxComponentsVector, forKey: "inputMaxComponents")
        
        contentFilters = [colorClampFilter]
    }
}
