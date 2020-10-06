//
//  Extensions.swift
//  Web Browse
//
//  Created by Eryk Szcześniak on 06/10/2020.
//  Copyright © 2020 Eryk Szcześniak. All rights reserved.
//

import UIKit

extension UserDefaults {
    var lastURL: URL? {
        get {
            return url(forKey: "url.last") ?? URL(string: "https://www.packtpub.com")
        }
        set {
            set(newValue, forKey: "url.last")
        }
    }
}

