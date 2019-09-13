//
//  CustomCell.swift
//  NewSensorApp
//
//  Created by Capgemini on 10/09/19.
//  Copyright © 2019 Capgemini. All rights reserved.
//
import UIKit

class CustomCell: UITableViewCell {
  //  @IBOutlet var id:UILabel!
    @IBOutlet var sensorname: UILabel!
    @IBOutlet var desc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
