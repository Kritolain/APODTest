//
//  ApodImageViewController.swift
//  APODTest
//
//  Created by Carolain Lenes Beltran on 19/06/20.
//  Copyright © 2020 Laborintos. All rights reserved.
//

import UIKit

class ApodImageViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var apodImageCollectionView : UICollectionView!
    @IBOutlet weak var heightViewConstraint : NSLayoutConstraint!
    
    //MARK: - Variables
    private var apodImageViewModel: ApodImageViewModel?
    private var cellSize: CGSize {
          get {
              return CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
          }
      }
    private var index: Int = 0
    
    /* Status bar Style  */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurerView()
        
    }
    
    private func configurerView(){
        self.apodImageViewModel = ApodImageViewModel(self)
        
        /*  screenHeight  */
        if (Utils.screenHeight >= 812) {
            self.heightViewConstraint.constant = 80
            return
        }
    }
    
    // MARK: - Functions
    func goNextController(){
        let segueIdentifier = SegueIdentifierType.apodImage.rawValue
        
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }

    func showLoadIndicator(){
        Utils.showLoading(self.view)
    }
    
    func hiddeLoadIndicator(){
        Utils.hiddenLoading(self.view)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let apodImageDetailVC : ApodImageDetailViewController = segue.destination as! ApodImageDetailViewController
        apodImageDetailVC.apiImage = self.apodImageViewModel?.imageArray[index]
    }
    
}

extension ApodImageViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.apodImageViewModel!.imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.apodImageViewModel!.cellForItemAt(collectionView, indexPath)
    }

}

extension ApodImageViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.index = indexPath.row
        self.goNextController()
    }
    
}

extension ApodImageViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size)
    }
    
}
