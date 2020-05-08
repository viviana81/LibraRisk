//
//  LibraRiskApi.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 30/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import Foundation
import Moya

enum LibraRiskApi: TargetType {
    
    case getEarthQuakes
    case getSismicRisk
    case getBehaviors
    case getNotifications
    case getPlaces
    case getColleges
    case getCollegeResponse(place: Place, college: College)
    
    
    var baseURL: URL {
        return URL(string: "https://private-064ec-librarisk.apiary-mock.com/")!
    }
    
    var path: String {
        switch self {
        case .getEarthQuakes:
            return "earthquakes"
        case .getSismicRisk:
            return "sismicRisk"
        case .getBehaviors:
            return "behaviors"
        case .getNotifications:
            return "notifications"
        case .getPlaces:
            return "places"
        case .getColleges:
            return "colleges"
        case .getCollegeResponse:
            return "collegeResponse"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getEarthQuakes, .getSismicRisk, .getBehaviors, .getNotifications, .getPlaces, .getColleges, .getCollegeResponse:
            return .get
            
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getEarthQuakes, .getSismicRisk, .getBehaviors, .getNotifications, .getPlaces, .getColleges:
            return .requestPlain
        case .getCollegeResponse(let place, let college):
            return .requestParameters(parameters: ["place": place, "college": college], encoding: JSONEncoding.default)
        }
        
    }
    var headers: [String : String]? {
        return [:]
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
    
}

