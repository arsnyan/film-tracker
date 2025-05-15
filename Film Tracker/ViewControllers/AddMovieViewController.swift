//
//  AddMovieViewController.swift
//  Film Tracker
//
//  Created by Арсен Саруханян on 15.05.2025.
//

import UIKit
import Foundation

class AddMovieViewController: UIViewController, MovieHolder {
    @IBOutlet var movieNameTextField: UITextField!
    @IBOutlet var releaseYearTextField: UITextField!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var ratingSlider: UISlider!
    
    var movieStore: MovieStore!
    
    private var sliderValue = 5.0 {
        didSet {
            ratingLabel.text = "Rating: \(sliderValue)/10"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderValue = 5
        ratingSlider.value = 5
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func cancelAction() {
        dismiss(animated: true)
    }
    
    @IBAction func saveAction() {
        view.endEditing(true)
        guard let name = movieNameTextField.text else { return }
        guard let releaseYear = releaseYearTextField.text else { return }
        if name.isEmpty { return }
        if let value = Double(releaseYear) {
            if value < 1888 || Int(value) > Calendar.current.component(.year, from: Date.now) {
                return
            }
        }
        movieStore.movies.append(Movie(name: name, releaseYear: Int(Double(releaseYear) ?? 0.0), rating: Double(ratingSlider.value), coverUrl: "", isFavorite: false))
        dismiss(animated: true)
    }
    
    @IBAction func ratingSetAction() {
        let value = String(format: "%.1f", ratingSlider.value)
        sliderValue = Double(value) ?? 0.0
    }
}

// MARK: - UITextFieldDelegate
extension AddMovieViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
