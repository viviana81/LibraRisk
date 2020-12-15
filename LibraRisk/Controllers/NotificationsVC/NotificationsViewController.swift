//
//  NotificationsViewController.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 29/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var notifications: [Notification] = [] {
        didSet {
            tableView?.reloadData() // Attaccon un property observer su behaviors, in modo da ricaricare la tabella una volta che assegno l'array di behaviors
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notifiche"
        tableView.register(NotificationsTableViewCell.self)
        
    }
}

extension NotificationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NotificationsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let notification = notifications[indexPath.row]
        cell.configure(withNotification: notification)
        return cell
    }
}
