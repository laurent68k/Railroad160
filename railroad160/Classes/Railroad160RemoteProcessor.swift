//
//  MainViewModel.swift
//  railroad160
//
//  Created by Laurent Favard on 08/08/2024.
//

import Foundation

class Railroad160RemoteProcessor {
 
    static let shared = Railroad160RemoteProcessor()
    public var baseUrl = "http://trains160.local"
    
    private init() {
        
    }
    
    //  -----------------------------------------------------------------------------------------------

    public func patchBuiltInLed(body: RequestBodyBuiltinLed) {
        
        let url = URL(string: "\(self.baseUrl)/led" )
        guard let url = url else {
            return
        }
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "PATCH"

        let body = try? JSONEncoder().encode(body)
        guard let body = body else {
            return
        }
        request.httpBody = body

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                // Handle HTTP request error                
                print(error.localizedDescription)
            } else if let data = data {
                // Handle HTTP request response
                print(data)
            } else {
                // Handle unexpected error
            }
        }.resume()
    }

    public func patchRelays(body: RequestBodyRelays) {
        
        let url = URL(string: "\(self.baseUrl)/relays")
        guard let url = url else {
            return
        }
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "PATCH"

        let body = try? JSONEncoder().encode(body)
        guard let body = body else {
            return
        }
        request.httpBody = body

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                // Handle HTTP request error                
                print(error.localizedDescription)
            } else if let data = data {
                // Handle HTTP request response
                print(data)
            } else {
                // Handle unexpected error
            }
        }.resume()
    }
    
    public func getRelays( onCompletion: @escaping (_ response: ResponseBodyRelays) -> Void ) {
        
        let url = URL(string: "\(self.baseUrl)/relays" )
        guard let url = url else {
            return
        }
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                // Handle HTTP request error
                print(error.localizedDescription)
            } else if let data = data {
                // Handle HTTP request response
                print(data)
                let responseBody = try? JSONDecoder().decode(ResponseBodyRelays.self, from: data)
                guard let responseBody = responseBody else {
                    return
                }
                onCompletion(responseBody)
            } else {
                // Handle unexpected error
            }
        }.resume()
    }
    
    public func postAutotest() {
        
        let url = URL(string: "\(self.baseUrl)/autotest" )
        guard let url = url else {
            return
        }
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                // Handle HTTP request error
                print(error.localizedDescription)
            } else if let data = data {
                // Handle HTTP request response
                print(data)
            } else {
                // Handle unexpected error
            }
        }.resume()
    }
    
    //  -----------------------------------------------------------------------------------------------

    public func builtinLedOn() {
        
        self.patchBuiltInLed(body: RequestBodyBuiltinLed(state: "on"))
    }
    
    public func builtinLedOff() {
        
        self.patchBuiltInLed(body: RequestBodyBuiltinLed(state: "off"))
    }
    
    public func relays() {
        let request = RequestBodyRelays(stationTrackOutside: "on",
                                        stationTrackInsside: "on",
                                        turnouts1: "on",
                                        turnouts2: "on",
                                        turnouts3: "on",
                                        turnouts4: "on",
                                        turnouts5: "on",
                                        turnouts6: "on",
                                        turnouts7: "on",
                                        turnouts8: "on",
                                        turnouts9: "on")
        
        self.patchRelays(body: request)
    }
    
    public func autoTest() {
        
        self.postAutotest()
    }
}
