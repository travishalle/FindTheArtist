//
//  ArtistCollectionViewCell.swift
//  FindTheArtist
//
//  Created by Travis Halle on 4/22/21.
//

import UIKit

class ArtistCollectionViewCell: UICollectionViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var artistImageView: UIImageView!
    
    //MARK: Properties
    var artist: Artist? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: Helper Functions
    func updateViews() {
        guard let artist = artist else {return}
        artistImageView.contentMode = .scaleAspectFill
        artistImageView.image = artist.photo
    }
}//End of class
