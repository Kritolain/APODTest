//
//  ApodImageViewModel.swift
//  APODTest
//
//  Created by Carolain Lenes Beltran on 22/06/20.
//  Copyright © 2020 Laborintos. All rights reserved.
//

import Foundation
import UIKit

class ApodImageViewModel {
    
    //MARK: - Variables
    private let last8DaysArray = Utils.getPastDates(8)
    private var apodImageViewController : ApodImageViewController!
    private let apodImageService = AlamofireApodImageService()
    var imageArray: [APIImage] = []
    
    init(_ apodImageViewController : ApodImageViewController){
        self.apodImageViewController = apodImageViewController
        self.getInfoData()
    }
    
    func getInfoData(){
        self.apodImageViewController.showLoadIndicator()
        for last8Day in last8DaysArray {
            let params: [String: Any] = ["api_key": api_key, "date": last8Day, "hd": true ]
            apodImageService.getInfoData(imageData: params, completion: { (result, imageData, responseError) in
                self.apodImageViewController.hiddeLoadIndicator()
                if responseError == nil && result {
                    self.imageArray.append(imageData!)
                    self.apodImageViewController.apodImageCollectionView.reloadData()
                    return
                }
                self.alertView()
            })
        }
    }
    
    //CollectionView methods
      func cellForItemAt( _ collectionView : UICollectionView , _ indexPath : IndexPath) -> UICollectionViewCell{
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ApodImageCollectionViewCell", for: indexPath) as! ApodImageCollectionViewCell
          cell.loadDataApodImage(imageArray[indexPath.row])
          return cell
      }
    
    
    private func goNextController(){
        self.apodImageViewController!.goNextController()
    }
    
    func alertView(){
        let alert = UIAlertController(title: "¡Atención!", message: "Algo ocurrió, intente nuevamente", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("Aceptar")
                
                
            case .cancel:
                break
            case .destructive:
                break
            @unknown default:
                break
            }}))
        self.apodImageViewController.present(alert, animated: true, completion: nil)
    }
}

