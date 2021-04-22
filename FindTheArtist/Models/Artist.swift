//
//  Artist.swift
//  FindTheArtist
//
//  Created by Travis Halle on 4/22/21.
//

import UIKit

class Artist {
    
    //MARK: Properties
    let name: String
    let photo: UIImage?
    let genre: String
    let uuid: String
    
    //MARK: Initializer
    init(name: String, photo: UIImage?, genre: String, uuid : String = UUID().uuidString) {
        self.name = name
        self.photo = photo
        self.genre = genre
        self.uuid = uuid
    }
}//End of class

extension Artist: Equatable {
    static func == (lhs: Artist, rhs: Artist) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}//End of extension
