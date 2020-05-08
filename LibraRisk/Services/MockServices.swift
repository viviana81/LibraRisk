//
//  MockServices.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 30/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import Foundation
import Moya

struct MockServices: Services {
    
    let provider = MoyaProvider<LibraRiskApi>(plugins: [NetworkLoggerPlugin(verbose: false, cURL: true)])
    
    let decoder = JSONDecoder()
    
    func getEarthQuakes(completion: @escaping ([EarthQuake]?, Error?) -> Void) {
        provider.request(.getEarthQuakes) { result in
            switch result {
            case.success(let response):
                let earthQuakes = try? self.decoder.decode([EarthQuake].self, from: response.data)
                completion(earthQuakes, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getSismicRisk(completion: @escaping ([SismicRisk]?, Error?) -> Void) {
        provider.request(.getSismicRisk) { result in
            switch result {
            case.success(let response):
                let sismicRisks = try? self.decoder.decode([SismicRisk].self, from: response.data)
                completion(sismicRisks, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getBehaviors(completion: @escaping ([Behavior]?, Error?) -> Void) {
        provider.request(.getBehaviors) { result in
            switch result {
            case.success(let response):
                let behaviors = try? self.decoder.decode([Behavior].self, from: response.data)
                completion(behaviors, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getNotifications(completion: @escaping ([Notification]?, Error?) -> Void) {
        provider.request(.getNotifications) { result in
            switch result {
            case.success(let response):
                let notifications = try? self.decoder.decode([Notification].self, from: response.data)
                completion(notifications, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getPlaces(completion: @escaping ([Place]?, Error?) -> Void) {
        provider.request(.getPlaces) { result in
            switch result {
            case.success(let response):
                let places = try? self.decoder.decode([Place].self, from: response.data)
                completion(places, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getColleges(completion: @escaping ([College]?, Error?) -> Void) {
        provider.request(.getColleges) { result in
            switch result {
            case.success(let response):
                let colleges = try? self.decoder.decode([College].self, from: response.data)
                completion(colleges, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getCollegeResponse(place: Place, college: College, completion: @escaping (CollegeResponse?, Error?) -> Void) {
        provider.request(.getCollegeResponse(place: place, college: college)) { result in
            switch result {
            case.success(let response):
                let collegeResponse = try? self.decoder.decode(CollegeResponse.self, from: response.data)
                completion(collegeResponse, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

