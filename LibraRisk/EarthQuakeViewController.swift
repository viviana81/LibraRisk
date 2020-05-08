//
//  EarthQuakeViewController.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 29/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit

class EarthQuakeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var earthQuakes: [EarthQuake] = []

    private let services: Services
    
    init(services: Services) {
        self.services = services
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Guarda terremoti"
        tableView.register(EarthQuakeTableViewCell.self)
        services.getEarthQuakes { (earthQuakes, error) in
            if let earthQuakes = earthQuakes {
                self.earthQuakes = earthQuakes
                self.tableView.reloadData()
            }
        }
    }
}

extension EarthQuakeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return earthQuakes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EarthQuakeTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let earthQuake = earthQuakes[indexPath.row]
        cell.textLabel?.text = earthQuake.title
        return cell
    }
}

extension EarthQuakeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let earthQuake = earthQuakes[indexPath.row]
        let detail = EarthQuakeDetailViewController(earthQuake: earthQuake)
        navigationController?.pushViewController(detail, animated: true)
    }
}
