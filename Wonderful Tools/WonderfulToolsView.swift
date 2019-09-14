//
//  WonderfulToolsView.swift
//  Wonderful Tools
//
//  Created by Jimmy Ti on 13/9/19.
//  Copyright © 2019 Jimmy Ti. All rights reserved.
//

import AVKit
import ScreenSaver

class WonderfulToolsView: ScreenSaverView {

    // MARK: Constant
    private enum Constant {
        static let secondPerFrame = 1.0 / 30.0
        static let backgroundColor = NSColor(red: 0.00, green: 0.01, blue: 0.00, alpha:1.0)
    }
    
    // MARK: Outlets
    private let videoLayer = AVPlayerLayer()
    
    // MARK: Properties
    private let manager = ScreenSaverManager(mode: .screensaver)
    private lazy var preferences = PreferencesWindowController(windowNibName: PreferencesWindowController.identifier, manager: manager)
    
    // MARK: Initialization
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        animationTimeInterval = Constant.secondPerFrame
        configure()
    }
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        animationTimeInterval = Constant.secondPerFrame
        configure()
    }
}

// MARK: - Lifecycle
extension WonderfulToolsView {
    
    override func startAnimation() {
        super.startAnimation()
        manager.player.play()
    }
    
    override func stopAnimation() {
        super.stopAnimation()
        manager.player.pause()
    }
}

// MARK: - Configuration
private extension WonderfulToolsView {
    
    func configure() {
        defineLayer()
        setupLayer()
        configureVideoLayer()
    }
    
    func defineLayer() {
        wantsLayer = true
        layer = videoLayer
    }
    
    func setupLayer() {
        videoLayer.player = manager.player
    }
}

// MARK: - Define Layers
private extension WonderfulToolsView {
    
    func configureVideoLayer() {
        videoLayer.frame = bounds
        videoLayer.autoresizingMask = [.layerWidthSizable, .layerHeightSizable]
        videoLayer.needsDisplayOnBoundsChange = true
        videoLayer.contentsGravity = .resizeAspectFill
        videoLayer.videoGravity = .resizeAspectFill
        videoLayer.backgroundColor = Constant.backgroundColor.cgColor
    }
}

// MARK: - Preferences
extension WonderfulToolsView {
    
    override var hasConfigureSheet: Bool {
        return true
    }
    
    override var configureSheet: NSWindow? {
        return preferences.window
    }
}
