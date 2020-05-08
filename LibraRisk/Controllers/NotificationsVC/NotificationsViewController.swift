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
    var notifications: [Notification] = []
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

        title = "Notifiche"
        tableView.register(NotificationsTableViewCell.self)
        services.getNotifications { (notifications, error) in
            if let notifications = notifications {
                self.notifications = notifications
                self.tableView.reloadData()
            }
        }
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
