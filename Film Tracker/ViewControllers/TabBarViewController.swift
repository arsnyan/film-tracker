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
        viewControllers?.forEach { ($0 as? MovieHolder)?.movieStore = movieStore }
    }
}
