//
//  OnboardingPartViewController.swift
//  FoodDeliveryTestApp
//
//  Created by Roman on 01/05/2024.
//

import UIKit

class OnboardingPartViewController: UIViewController {

    // MARK: - Properties
    var imageToShow: UIImage? {
        didSet {
            imageView.image = imageToShow
        }
    }
    
    var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    var descriptionText: String?
    
    var buttonText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    
    // MARK: - Views
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setuplayout()
    }
}

// MARK: - Layout

private extension OnboardingPartViewController {
    
    func setuplayout() {
        setupView()
        setupImageView()
        setupTitle()
        setupDescription()
    }
    
    func setupImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    func setupTitle() {
        
        view.addSubview(titleLabel)
               titleLabel.translatesAutoresizingMaskIntoConstraints = false
               titleLabel.font = .Roboto.bold.size(of: 24)
               titleLabel.textColor = AppColors.white
               titleLabel.textAlignment = .center
               NSLayoutConstraint.activate([
                   titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
                   titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
               ])
    }
    func setupDescription() {
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = .Roboto.regular.size(of: 14)
        descriptionLabel.textColor = AppColors.white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            descriptionLabel.centerYAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 23),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 71),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -72)
        ])
    }
    
    func setupView() {
        view.backgroundColor = AppColors.accentOrange
    }
    
    
}
