//
//  ArtistCollectionViewController.swift
//  FindTheArtist
//
//  Created by Travis Halle on 4/22/21.
//

import UIKit

private let reuseIdentifier = "artistCell"

class ArtistCollectionViewController: UICollectionViewController {
    
    //MARK: Properties
    var displayedArtists: [Artist] = []
    var targetedArtist: Artist?
    var selectedGenre = "Pop"
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleArtists(genre: selectedGenre)
    }
    
    //MARK: Helper Methods
    func shuffleArtists(genre: String) {
        //This needs to be cleaned up
        if genre == "Country" {
            guard let classicalArtist = ArtistController.classical.randomElement(),
                  let hipHopArtist = ArtistController.hipHop.randomElement(),
                  let popArtist = ArtistController.pop.randomElement() else {return}
            displayedArtists = [classicalArtist, hipHopArtist, popArtist]
            targetedArtist = ArtistController.country.randomElement()
        } else if genre == "Classical" {
            guard let countryArtist = ArtistController.country.randomElement(),
                  let hipHopArtist = ArtistController.hipHop.randomElement(),
                  let popArtist = ArtistController.pop.randomElement() else {return}
            displayedArtists = [countryArtist, hipHopArtist, popArtist]
            targetedArtist = ArtistController.classical.randomElement()
        } else if genre == "Hip Hop" {
            guard let classicalArtist = ArtistController.classical.randomElement(),
                  let countryArtist = ArtistController.country.randomElement(),
                  let popArtist = ArtistController.pop.randomElement() else {return}
            displayedArtists = [classicalArtist, countryArtist, popArtist]
            targetedArtist = ArtistController.hipHop.randomElement()
        } else {
            guard let classicalArtist = ArtistController.classical.randomElement(),
                  let hipHopArtist = ArtistController.hipHop.randomElement(),
                  let countryArtist = ArtistController.country.randomElement() else {return}
            displayedArtists = [classicalArtist, hipHopArtist, countryArtist]
            targetedArtist = ArtistController.pop.randomElement()
        }
        updateViews()
    }
    
    func updateViews() {
        guard let artist = targetedArtist else {return}
        displayedArtists.append(artist)
        displayedArtists.shuffle()
        self.title = "Find \(artist.name)"
        collectionView.reloadData()
    }
    
    func presentAlert(artist: Artist) {
        let success = artist == targetedArtist
        let alertController = UIAlertController(title: success ? "Good Job" : "Better luck next time", message: nil, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        let shuffleAction = UIAlertAction(title: "Shuffle", style: .default) { (_) in
            self.shuffleArtists(genre: self.selectedGenre)
        }
        alertController.addAction(doneAction)
        if success {
            alertController.addAction(shuffleAction)
        }
        present(alertController, animated: true)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFilterVC" {
            guard let destination = segue.destination as? FilterViewController else {return}
            destination.delegate = self
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedArtists.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ArtistCollectionViewCell else {return UICollectionViewCell()}
        
        let artist = displayedArtists[indexPath.row]
        cell.artist = artist
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentAlert(artist: displayedArtists[indexPath.row])
    }
    
}//End of class


extension ArtistCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width/2
        let height = view.frame.height/2.5
        return CGSize(width: width-20, height: height)
    }
}//End of extension

extension ArtistCollectionViewController: FilterSelectionDelegate {
    func genreSelected(genre: String) {
        selectedGenre = genre
        shuffleArtists(genre: selectedGenre)
    }
}//End of extension

