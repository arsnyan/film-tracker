//
//  TabBarViewController.swift
//  Film Tracker
//
//  Created by Арсен Саруханян on 14.05.2025.
//

import UIKit

final class TabBarViewController: UITabBarController {
    private var movieStore = MovieStore(movies: Movie.getMovies())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addMovieVC = segue.destination as? AddMovieViewController
        addMovieVC?.movieStore = movieStore
    }
    
    func setupViewControllers() {
        viewControllers?.forEach { ($0 as? MovieHolder)?.movieStore = movieStore }
    }
    
    @IBAction func addMovieAction(_ sender: Any) {
        performSegue(withIdentifier: "addMovie", sender: sender)
    }
}
