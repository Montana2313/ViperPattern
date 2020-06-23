//
//  MainInstreactor.swift
//  ViperPattern
//
//  Created by Mac on 23.06.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

class MainIntreactor  : Presentor2IntreactorDelegate{
    var presentor: Intreactor2PresentDelegate?
    
    func fetchData() {
        guard let url = URL(string: Constant.url) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            if let response = response{
                let httpResponse = response as! HTTPURLResponse
                print("Status Code : \(httpResponse.statusCode)")
            }
            if let err = err {
                print("Something went wrong  cause of \(err.localizedDescription)")
            }
            if let data = data {
                print(response as Any)
                DispatchQueue.global(qos: .background).async {
                     self.parseJSON(data: data)
                }
               
            }
        }
        task.resume()
    }
    
    func parseJSON(data: Data){
        let decoder = JSONDecoder()
        do {
            let photodetail = try decoder.decode(PhotoDetail.self, from: data)
            print(photodetail.result)
            presentor?.sendPhotos(photodetail)
        }catch {
            print("Parsing error")
        }
    }
}

