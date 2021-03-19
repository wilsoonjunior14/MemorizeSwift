//
//  CustomTableViewCell.swift
//  Memorize
//
//  Created by Wilson on 16/03/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var leftButton: UIButton?
    @IBOutlet var rightButton: UIButton?
    @IBOutlet var middleButton: UIButton?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
