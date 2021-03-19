//
//  CustomCollectionViewCollectionViewCell.swift
//  Memorize
//
//  Created by Wilson on 16/03/21.
//

import UIKit

class CustomCollectionViewCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setImage(name: String){
        self.imageView?.image = UIImage(named: name)
    }

}
