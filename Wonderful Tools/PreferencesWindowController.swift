//
//  PreferencesWindowController.swift
//  Wonderful Tools
//
//  Created by Jimmy Ti on 13/9/19.
//  Copyright © 2019 Jimmy Ti. All rights reserved.
//

import Cocoa

class PreferencesWindowController: NSWindowController, NSWindowDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var soundEnabledCheckbox: NSButton!
    
    // MARK: Private Properties
    private weak var manager: ScreenSaverManager?
}

// MARK: - Lifecycle
extension PreferencesWindowController {
    
    convenience init(windowNibName: NSNib.Name , manager: ScreenSaverManager) {
        self.init(windowNibName: windowNibName)
        self.manager = manager
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        configure()
    }
}

// MARK: - Configuration
private extension PreferencesWindowController {
    
    func configure() {
        setupButtons()
    }
    
    func setupButtons() {
        if let manager = manager {
            soundEnabledCheckbox.state = manager.isSoundEnabled ? .on : .off
        }
    }
}

// MARK: - Actions
private extension PreferencesWindowController {
    
    @IBAction func toggleSoundAction(_ sender: NSButton) {
        if let manager = manager {
            manager.toggleIsSoundEnabled()
        }
    }
    
    @IBAction func helpAction(_ sender: NSButton) {
        URLType.help.open()
    }
    
    @IBAction func githubAction(_ sender: NSButton) {
        URLType.github.open()
    }
    
    
    @IBAction func twitterAction(_ sender: NSButton) {
        URLType.twitter.open()
    }
    
    @IBAction func doneAction(_ sender: NSButton) {
        guard let window = window else { return }
        window.sheetParent?.endSheet(window)
    }
}

// MARK: - Identifier
extension PreferencesWindowController {
    
    static var identifier: String { return String(describing: self) }
}
