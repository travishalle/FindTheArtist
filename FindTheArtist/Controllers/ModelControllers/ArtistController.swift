//
//  ArtistController.swift
//  FindTheArtist
//
//  Created by Travis Halle on 4/22/21.
//

import UIKit

class ArtistController {
    static let country = [Artist(name: "Tim McGraw", photo: UIImage(named: "timMcGraw"), genre: "Country"),
                          Artist(name: "Billy Ray Cyrus", photo: UIImage(named: "billyRayCyrus"), genre: "Country"),
                          Artist(name: "Dolly Parton", photo: UIImage(named: "dollyParton"), genre: "Country"),
                          Artist(name: "Johny Cash", photo: UIImage(named: "johnnyCash"), genre: "Country")]
    static let hipHop = [Artist(name: "Kanye West", photo: UIImage(named: "kanyeWest"), genre: "Hip Hop"),
                         Artist(name: "Snoop Dogg", photo: UIImage(named: "snoopDogg"), genre: "Hip Hop"),
                         Artist(name: "Eminem", photo: UIImage(named: "eminem"), genre: "Hip Hop"),
                         Artist(name: "Dr. Dre", photo: UIImage(named: "drDre"), genre: "Hip Hop")]
    static let classical = [Artist(name: "Beethoven", photo: UIImage(named: "beethoven"), genre: "Classical"),
                            Artist(name: "Tchaikovsky", photo: UIImage(named: "tchaikovsky"), genre: "Classical"),
                            Artist(name: "Frederic Chopin", photo: UIImage(named: "fredericChopin"), genre: "Classical"),
                            Artist(name: "Mozart", photo: UIImage(named: "mozart"), genre: "Classical")]
    static let pop = [Artist(name: "Katy Perry", photo: UIImage(named: "katyPerry"), genre: "Pop"),
                      Artist(name: "Britney Spears", photo: UIImage(named: "britneySpears"), genre: "Pop"),
                      Artist(name: "Kygo", photo: UIImage(named: "kygo"), genre: "Pop"),
                      Artist(name: "The Weeknd", photo: UIImage(named: "theWeeknd"), genre: "Pop")]
 }
