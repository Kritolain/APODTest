//
//  ApodImageCollectionViewCell.swift
//  APODTest
//
//  Created by Carolain Lenes Beltran on 22/06/20.
//  Copyright © 2020 Laborintos. All rights reserved.
//

import UIKit
import AlamofireImage

class ApodImageCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var apodImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    
    
    func loadDataApodImage(_ apodImage: APIImage){
        self.titleLabel.text = apodImage.title
        self.copyrightLabel.text = apodImage.copyright
        guard let url = apodImage.hdurl else {
            return
        }
        self.loadImage(url)
    }
    
    private func loadImage(_ urlString: String){
        
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
    
}
