//
//  AnimalTableViewCell.swift
//  
//
//  Created by jinikuadmin on 3/9/17.
//
//

import UIKit

class AnimalTableViewCell: UITableViewCell {
    
    //Properties
    
    @IBOutlet weak var animalLabel: UILabel!
    
    @IBOutlet weak var animalIcon: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
