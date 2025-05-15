//
//  DetailsViewController.swift
//  Film Tracker
//
//  Created by Арсен Саруханян on 15.05.2025.
//

import UIKit

protocol TableViewControllerUpdateDelegate: AnyObject {
    func updateData()
}

class DetailsViewController: UIViewController {
    @IBOutlet var coverImageView: UIImageView!
    @IBOutlet var movieNameLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    
    weak var delegate: TableViewControllerUpdateDelegate?
    var movieStore: MovieStore!
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: movie.coverUrl) {
            Task {
                let (data, _) = try await URLSession.shared.data(from: url)
                await MainActor.run {
                    coverImageView.image = UIImage(data: data)
                }
            }
        }
        movieNameLabel.text = movie.name
        ratingLabel.text = "\(movie.rating)/10"
        releaseDateLabel.text = "Released in \(movie.releaseYear)"
    }
    
    @IBAction func deleteMovieAction(_ sender: Any) {
        guard let idx = movieStore.movies.firstIndex(where: { $0.name == movie.name }) else { return }
        movieStore.movies.remove(at: idx)
        delegate?.updateData()
        navigationController?.popViewController(animated: true)
    }
}
