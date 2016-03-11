//
//  AppDelegate.swift
//  DOOM
//
//  Created by Watanabe Toshinori on 3/8/16.
//
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var shortcutView: MASShortcutView!
    
    @IBOutlet weak var statusBarMenu: NSMenu!
    
    var statusItem: NSStatusItem!
    
    // MARK: - Initialize
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Add icon to statsu bar
        statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
        statusItem.image = NSImage(named: "StatusMenuIcon")
        statusItem.menu = statusBarMenu
        statusItem.highlightMode = true

        let key = "CustomShortcutKey"
        shortcutView.associatedUserDefaultsKey = key
        MASShortcutBinder.sharedBinder().bindShortcutWithDefaultsKey(key, toAction: { () -> Void in
            // ドンッ!
            DOOM👊()
        })
    }
    
    // MARK: - Action

    @IBAction func showPreferenceWindow(sender: AnyObject) {
        window.makeKeyAndOrderFront(self)
    }
    
}

