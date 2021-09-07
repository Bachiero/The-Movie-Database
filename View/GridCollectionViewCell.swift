//
//  GridCollectionViewCell.swift
//  Movies
//
//  Created by Bacho Bitsadze on 03.09.21.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {

    static let identifier = "GridCollectionViewCell"

    @IBOutlet var movieImage: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
        movieImage?.clipsToBounds = true
        movieImage?.contentMode = .scaleAspectFill
        movieImage?.layer.masksToBounds = true
        movieImage?.frame = CGRect(x: 0, y: 0, width: 130, height: 100)
        movieImage?.layer.borderWidth = 0.4
        movieImage?.layer.borderColor = UIColor.white.cgColor
        
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
}
    
    public func configure(with name: String){
        movieImage?.image = UIImage(named: name)
    }
    
    

   
}

