//
//  SensorCellTableViewCell.swift
//  NewSensorApp
//
//  Created by Capgemini on 10/09/19.
//  Copyright © 2019 Capgemini. All rights reserved.
//

import UIKit

class SensorCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sensorDesc: UILabel!
    @IBOutlet weak var sensorName: UILabel!
    @IBOutlet weak var sensorId: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
