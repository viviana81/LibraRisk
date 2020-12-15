//
//  Coordinator.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 30/05/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import Foundation

protocol Coordinator {
    var coordinators: [Coordinator] { get set }
    func start()
}
