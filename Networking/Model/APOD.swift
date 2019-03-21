//
//  APOD.swift
//  Networking
//
//  Created by Jason Kim on 3/20/19.
//  Copyright © 2019 jklabs. All rights reserved.
//

import Foundation

struct APOD: Codable {
    let date, explanation, mediaType, serviceVersion: String
    let title: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case date, explanation
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}
