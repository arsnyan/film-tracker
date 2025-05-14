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
    
    func setupViewControllers() {
        viewControllers?.forEach { vc in
            if let moviesListVC = (vc as? UINavigationController)?.topViewController as? MovieHolder {
                moviesListVC.movieStore = movieStore
            } else if let favoritesListVC = vc as? MovieHolder {
                favoritesListVC.movieStore = movieStore
            }
        }
    }
}
