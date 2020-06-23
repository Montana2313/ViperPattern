//
//  ViewController.swift
//  ViperPattern
//
//  Created by Mac on 23.06.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import SDWebImage
class MainViewController: UIViewController {
    
    var presenter : View2Present?
    private var imageView : UIImageView!
    private var textTitle : UILabel!
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.presenter?.update()
        
    }
    private func setup(){
        self.view.backgroundColor = .white
        
        self.imageView = {
              let imgView = UIImageView()
              imgView.layer.borderWidth = 1.0
              imgView.layer.borderColor = UIColor.lightGray.cgColor
              return imgView
          }()
        self.textTitle = {
              let lbl  = UILabel()
              lbl.text = ""
              lbl.textAlignment = .center
            lbl.font = UIFont(name: "Helvetica", size: 20.0)
              lbl.textColor = .brown
              lbl.numberOfLines = 0
              return lbl
          }()
        
        imageView.frame = CGRect(x: 20, y: (screenWidth / 2.0) - 100, width: screenWidth - 40, height: 200)
        textTitle.frame = CGRect(x: 10, y: (screenWidth / 2.0) + 110, width: screenWidth - 20, height: 100)
        
        self.view.addSubview(imageView)
        self.view.addSubview(textTitle)
    }
    
}
extension MainViewController: Present2ViewDelegate {
    func showPhotoDetails(_ data: PhotoDetail) {
        guard let firstItem = data.result.first else {return}
        guard let imageURL = URL(string: firstItem.thumbnail) else {return}
        DispatchQueue.main.async {
            self.imageView.sd_setImage(with: imageURL, completed: nil)
            self.textTitle.text = firstItem.title
        }
    }
    func throwError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

