//
//  NotificationsTableViewCell.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 01/05/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit

class NotificationsTableViewCell: UITableViewCell, Reusable {

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    func configure(withNotification notification: Notification) {
        subtitleLabel.text = notification.subtitle
        bodyLabel.text = notification.body
        timeLabel.text = notification.time
    }
}
