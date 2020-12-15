//
//  BehaviorsViewController.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 29/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit

protocol BehaviorsViewControllerDelegate {
    func openBehavior(_ behavior: Behavior)
}

class BehaviorsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
   
    var delegate: BehaviorsViewControllerDelegate?
    var behaviors: [Behavior] = [] {
        didSet {
            tableView?.reloadData() // Attaccon un property observer su behaviors, in modo da ricaricare la tabella una volta che assegno l'array di behaviors
        }
    }
    
   override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Comportamenti"
        tableView.register(BehaviorsTableViewCell.self)
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
        delegate?.openBehavior(behavior)
        
    }
}
