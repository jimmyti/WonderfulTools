//
//  LoopPlayer.swift
//  Wonderful Tools
//
//  Created by Jimmy Ti on 13/9/19.
//  Copyright © 2019 Jimmy Ti. All rights reserved.
//

import AVFoundation

final class LoopPlayer: AVPlayer {

    // MARK: Lifecycle
    override init(playerItem: AVPlayerItem?) {
        super.init(playerItem: playerItem)
        observe()
    }
    
    override init() {
        super.init()
        observe()
    }
    
    deinit {
        unobserve()
    }
}

// MARK: - Observers
private extension LoopPlayer {
    
    func observe() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidFinish),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: nil)
    }
    
    func unobserve() {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                  object: nil)
    }
    
    @objc
    func playerItemDidFinish() {
        guard let currentItem = currentItem else { return }
        currentItem.seek(to: CMTime.zero)
        play()
    }
}
