//
//  ScreenSaverManager.swift
//  Wonderful Tools
//
//  Created by Jimmy Ti on 13/9/19.
//  Copyright © 2019 Jimmy Ti. All rights reserved.
//

import ScreenSaver
import AVKit

// MARK: - DisplayModel
enum DisplayMode {
    case screensaver
    case preferences
}

// MARK: ScreenSaverManager
final class ScreenSaverManager {
    
    // MARK: Constant
    private enum Constant {
        static let video = "Wonderful Tools"
        static let ext = "mp4"
    }
    
    // MARK: Properties
    let player: AVPlayer
    
    // MARK: Private Set Properties
    private (set) var isSoundEnabled: Bool
    
    // MARK: Init
    init(mode: DisplayMode) {
        isSoundEnabled = Database.standard.isSoundEnabled
        
        guard let item = AVPlayerItem(video: Constant.video,
                                      extension: Constant.ext,
                                      for: ScreenSaverManager.self) else {
            fatalError("Failed to initialize screen saver video asset")
        }
        player = LoopPlayer(playerItem: item)
        player.isMuted = !isSoundEnabled
    }
}

// MARK: - Preferences
extension ScreenSaverManager {
    
    func toggleIsSoundEnabled() {
        isSoundEnabled.toggle()
        Database.standard.set(isSoundEnabled: isSoundEnabled)
        player.isMuted = !isSoundEnabled
    }
}

extension AVPlayerItem {
    
    convenience init?(video: String, extension ext: String, for caller: AnyClass) {
        guard let url = Bundle(for: caller).url(forResource: video,
                                                withExtension: ext) else { return nil }
        self.init(url: url)
    }
}

