//
//  MainRouter.swift
//  ViperPattern
//
//  Created by Mac on 23.06.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit

class MainRouter: Present2RouterDelegate {
    func throwError() {
        print("err")
    }
    func createModule() -> UIViewController {
        let viewController = MainViewController()
        
        var presenter : View2Present & Intreactor2PresentDelegate = MainPresenter()
        var inreactor : Presentor2IntreactorDelegate  = MainIntreactor()
        let router : Present2RouterDelegate = MainRouter()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.intreactor = inreactor
        presenter.router = router
        inreactor.presentor = presenter
        
        return viewController
    }
}

