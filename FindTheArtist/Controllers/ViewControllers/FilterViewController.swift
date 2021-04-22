//
//  FilterViewController.swift
//  FindTheArtist
//
//  Created by Travis Halle on 4/22/21.
//

import UIKit

protocol FilterSelectionDelegate: AnyObject {
    func genreSelected(genre: String)
}

class FilterViewController: UIViewController {
    
    //MARK: Properties
    weak var delegate: FilterSelectionDelegate?
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Outlets
    @IBAction func countryButtonTapped(_ sender: Any) {
        delegate?.genreSelected(genre: "Country")
        self.dismiss(animated: true)
    }
    
    @IBAction func hipHopButtonTapped(_ sender: Any) {
        delegate?.genreSelected(genre: "Hip Hop")
        self.dismiss(animated: true)
    }
    
    @IBAction func popButtonTapped(_ sender: Any) {
        delegate?.genreSelected(genre: "Pop")
        self.dismiss(animated: true)
    }
    
    @IBAction func classicalButtonTapped(_ sender: Any) {
        delegate?.genreSelected(genre: "Classical")
        self.dismiss(animated: true)
    }
}//End of class
