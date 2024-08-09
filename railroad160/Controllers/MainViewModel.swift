//
//  MainViewModel.swift
//  railroad160
//
//  Created by Laurent Favard on 08/08/2024.
//

import Foundation

class MainViewModel {
 
    static let shared = MainViewModel()
        
    private init() {
        
    }
    
    //  -----------------------------------------------------------------------------------------------

    public func patch(atUrl: String, body: String) {
        
        let url = URL(string: atUrl)!
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "PATCH"
        request.httpBody = String(body).data(using: .utf8)

//        let encoder = JSONEncoder()
//        let bodyData = MainViewModel.getPostString(params: body)
//        request.httpBody = bodyData.data(using: .utf8)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                // Handle HTTP request error                print(error.localizedDescription)
            } else if let data = data {
                // Handle HTTP request response
                print(data)
            } else {
                // Handle unexpected error
            }
        }.resume()
        
    }
    
    //  -----------------------------------------------------------------------------------------------

    
    public func ledOn() {
        
        self.patch(atUrl: "http://trains160.local/led", body: "{ \"state\": \"on\"}")
    }
    
    public func ledOff() {
        
        self.patch(atUrl: "http://192.168.1.112/led",body: "{ \"state\": \"off\"}")
    }
}
