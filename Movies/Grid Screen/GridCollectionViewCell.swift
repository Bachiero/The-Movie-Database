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
    
    
    
    
    
    
    
    public func configure(with name: String){
        movieImage?.image = UIImage(named: name)
    }
    
}
