//
//  Models.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 29/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import Foundation

struct EarthQuake: Codable {
    
    let title: String
    let url: String
}


 struct SismicRisk: Codable {
    let title: String
    let subtitle: String
    let description: String
    let imageUrl: [String]
    
}

struct Behavior: Codable {
    let title: String
    let subtitle: String
    let description: String
    let imageUrl: [String]
}

struct Notification: Codable {
    
    let title: String
    let subtitle: String
    let body: String
    let time: String
}

struct Place: Codable {
    let name: String
    let id: String
}

struct College: Codable {
    let name: String
    let id: String
}

struct CollegeResponse: Codable {
    let title: String
    let subtitle: String
    let description: String
    let imageUrl: [String]
}

