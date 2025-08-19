//
//  MusicTableViewCell.swift
//  Modal
//
//  Created by COTEMIG on 01/07/25.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    
        
        
    @IBOutlet weak var musicTitleLabel: UILabel!
    
    @IBOutlet weak var artistNameLabel: UILabel!
    
    

        override func awakeFromNib() {
            super.awakeFromNib()
            
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
        }

}
