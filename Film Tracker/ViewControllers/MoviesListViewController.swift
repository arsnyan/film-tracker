//
//  ViewController.swift
//  Film Tracker
//
//  Created by Арсен Саруханян on 12.05.2025.
//

import UIKit

final class MoviesListViewController: UITableViewController, MovieHolder {
    var movieStore: MovieStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let row = tableView.indexPathForSelectedRow?.row else { return }
        let detailsVC = segue.destination as? DetailsViewController
        detailsVC?.movie = movieStore.movies[row]
    }
}

// MARK: - UITableViewDataSource
extension MoviesListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieStore.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        let movie = movieStore.movies[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = movie.name
        content.secondaryText = "Released in \(movie.releaseYear)"
        content.imageProperties.cornerRadius = 4
        let favButton = UIButton.systemButton(
            with: UIImage(systemName: movie.isFavorite ? "star.fill" : "star")!,
            target: nil,
            action: nil
        )
        favButton.addAction(
            UIAction { [weak self] _ in
                self?.movieStore.movies[indexPath.row].isFavorite.toggle()
                self?.tableView.reloadData()
            },
            for: .touchUpInside
        )
        cell.accessoryView = favButton
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MoviesListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
