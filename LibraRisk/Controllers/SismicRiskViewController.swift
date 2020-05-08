//
//  SismicRiskViewController.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 29/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit

class SismicRiskViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var sismicRisks: [SismicRisk] = []
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

        title = "Pericolosità sismica"
        tableView.register(SismicRiskTableViewCell.self)
        services.getSismicRisk { (sismicRisks, error) in
            if let sismicRisks = sismicRisks {
                self.sismicRisks = sismicRisks
                self.tableView.reloadData()
            }
        }
    }
}

extension SismicRiskViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sismicRisks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SismicRiskTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let sismicRisk = sismicRisks[indexPath.row]
        cell.textLabel?.text = sismicRisk.title
        return cell
    }
}

extension SismicRiskViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sismicRisk = sismicRisks[indexPath.row]
        let riskDetail = SismicRiskDetailViewController(sismicRisk: sismicRisk)
        navigationController?.pushViewController(riskDetail, animated: true)
        
    }
}

