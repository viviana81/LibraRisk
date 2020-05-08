//
//  ServicesProtocol.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 29/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import Foundation

protocol Services {
    
    func getEarthQuakes(completion: @escaping ([EarthQuake]?, Error?) -> Void)
    
    func getSismicRisk(completion: @escaping ([SismicRisk]?, Error?) -> Void)
    
    func getBehaviors(completion: @escaping ([Behavior]?, Error?) -> Void)
    
    func getNotifications(completion: @escaping ([Notification]?, Error?) -> Void)
    
    func getPlaces(completion: @escaping ([Place]?, Error?) -> Void)
    
    func getColleges(completion: @escaping ([College]?, Error?) -> Void)
    
    func getCollegeResponse(place: Place, college: College, completion: @escaping (CollegeResponse?, Error?) -> Void)
}
