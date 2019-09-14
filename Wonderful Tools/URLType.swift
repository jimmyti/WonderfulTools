//
//  URLType.swift
//  Wonderful Tools
//
//  Created by Jimmy Ti on 13/9/19.
//  Copyright © 2019 Jimmy Ti. All rights reserved.
//

import Cocoa

// MARK: - URLType
enum URLType: String {
    case help = "https://github.com/jimmyti/WonderfulTools/issues"
    case github = "https://github.com/jimmyti/WonderfulTools"
    case twitter = "https://twitter.com/jimmyti"
}

// MARK: Functions
extension URLType {
    
    func open() {
        guard let url = URL(string: rawValue) else { return }
        NSWorkspace.shared.open(url)
    }
}
