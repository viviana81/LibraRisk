//
//  BehaviorsViewController.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 29/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit

class BehaviorsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var behaviors: [Behavior] = []
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
        
        title = "Comportamenti"
        tableView.register(BehaviorsTableViewCell.self)
        
        services.getBehaviors { (behaviors, error) in
            if let behaviors = behaviors {
                self.behaviors = behaviors
                self.tableView.reloadData()
            }
        }
    }
}

extension BehaviorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return behaviors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: BehaviorsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let behavior = behaviors[indexPath.row]
        cell.configure(withBehavior: behavior)
        return cell
        
    }
}

extension BehaviorsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let behavior = behaviors[indexPath.row]
        let detail = BehaviorDetailViewController(behavior: behavior)
        navigationController?.pushViewController(detail, animated: true)
    }
    
}
