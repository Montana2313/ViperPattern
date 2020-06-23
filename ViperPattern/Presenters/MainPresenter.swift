//
//  MainPresenter.swift
//  ViperPattern
//
//  Created by Mac on 23.06.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

class MainPresenter: View2Present {
    var view: Present2ViewDelegate?
    
    var intreactor: Presentor2IntreactorDelegate?
    
    var router: Present2RouterDelegate?
    
    func update() {
        // ViewDan gelen isteği intreator ileterek veri çekmesini söylecek
        intreactor?.fetchData()
    }
}
extension MainPresenter : Intreactor2PresentDelegate {
    func sendPhotos(_ data: PhotoDetail) {
        // intearctor'dan gelen veriler view'a göndermesini sağlayacak
        view?.showPhotoDetails(data)
    }
    
    func throwError() {
        view?.throwError()
    }
    
}
