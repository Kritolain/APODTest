//
//  ApodImageDetailViewController.swift
//  APODTest
//
//  Created by Carolain Lenes Beltran on 22/06/20.
//  Copyright © 2020 Laborintos. All rights reserved.
//

import UIKit

class ApodImageDetailViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var apodImage : UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var heightViewConstraint : NSLayoutConstraint!
    
    //MARK: - Variables
    var apiImage: APIImage!
    
    /* Status bar Style  */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurerView()
    }
    
    private func configurerView() {
        self.titleLabel.text = self.apiImage.title
        self.copyrightLabel.text = self.apiImage.copyright
        self.descriptionLabel.text = self.apiImage.explanation
        guard let url = apiImage.hdurl else {
            return
        }
        self.loadImage(url)
        
        /*  screenHeight  */
        if (Utils.screenHeight >= 812) {
            self.heightViewConstraint.constant = 80
            return
        }
    }
    
    private func loadImage(_ urlString: String) {
        
        let url = URL(string: urlString)!
        let placeholderImage = UIImage(named: "maps-and-location")!
        
        self.apodImage?.af.setImage(withURL: url, placeholderImage: placeholderImage, filter: nil, imageTransition: .crossDissolve(0.5), completion: { (response) -> Void in
            guard response.value != nil else {
                return
            }
            let image = response.value
            let size = CGSize(width: 146, height: 126)
            let scaledImage = image?.af.imageScaled(to: size)
            DispatchQueue.main.async {
                self.apodImage.image = scaledImage
            }
        })
        
    }
    
    //MARK: - IBActions
    
    @IBAction func backAction(){
        self.navigationController?.popViewController(animated: true)
    }
}
