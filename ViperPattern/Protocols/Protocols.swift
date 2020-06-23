//
//  Protocols.swift
//  ViperPattern
//
//  Created by Mac on 23.06.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit


// Protocols
protocol Present2ViewDelegate {
    // Presentten gelen verileri view'a taşıcak
    func showPhotoDetails(_ data : PhotoDetail)
    func throwError()
}
protocol Intreactor2PresentDelegate {
    func sendPhotos(_ data: PhotoDetail)
    func throwError()
}
protocol Presentor2IntreactorDelegate {
    var presentor : Intreactor2PresentDelegate? {get set}
    func fetchData()
}
protocol View2Present {
    var view : Present2ViewDelegate? {get set}
    var intreactor : Presentor2IntreactorDelegate? {get set}
    var router : Present2RouterDelegate? {get set}
    func update()
}
protocol Present2RouterDelegate {
    func createModule() -> UIViewController
    func throwError()
}
