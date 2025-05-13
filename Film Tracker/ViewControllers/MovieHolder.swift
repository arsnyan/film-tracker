//
//  MovieHolder.swift
//  Film Tracker
//
//  Created by Арсен Саруханян on 14.05.2025.
//

import Foundation

protocol MovieHolder: AnyObject {
    var movieStore: MovieStore { get set }
}
