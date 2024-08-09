//
//  UIApplication.swift
//  railroad160
//
//  Created by Laurent Favard on 09/08/2024.
//

import UIKit

extension UIApplication {
    
    static var applicatioDisplayName : String {
        
        let appName : String = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? "No title"
        
        return appName
    }
    
    static var applicationBuildVersion: String {
    
        let version : String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? String.empty
        let build : String = Bundle.main.infoDictionary?[kCFBundleVersionKey as String] as? String ?? String.empty
        
        return "Version \(version) Build \(build)"
    }
}

extension String {
    
    static let empty = ""
    
}

