//
//  FavoritesTableViewController.swift
//  Film Tracker
//
//  Created by Арсен Саруханян on 14.05.2025.
//

import UIKit

final class FavoritesTableViewController: UITableViewController, MovieHolder {
    var movieStore: MovieStore!
    private var favoriteMovies: [Movie] {
        movieStore.movies.filter { $0.isFavorite }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let row = tableView.indexPathForSelectedRow?.row else { return }
        let detailsVC = segue.destination as? DetailsViewController
        detailsVC?.movie = favoriteMovies[row]
    }
}

// MARK: - UITableViewDataSource
extension FavoritesTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteMovies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        let movie = favoriteMovies[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = movie.name
        content.secondaryText = "Released in \(movie.releaseYear)"
        cell.contentConfiguration = content
        let favButton = UIButton.systemButton(
            with: UIImage(systemName: movie.isFavorite ? "star.fill" : "star")!,
            target: nil,
            action: nil
        )
        favButton.addAction(
            UIAction(handler: { [weak self] _ in
                if let mov = self?.favoriteMovies[indexPath.row] {
                    if let idx = self?.movieStore.movies.firstIndex(where: { $0.name == mov.name }) {
                        self?.movieStore.movies[idx].isFavorite.toggle()
                    }
                }
                self?.tableView.reloadData()
            }),
            for: .touchUpInside
        )
        cell.accessoryView = favButton
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension FavoritesTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
