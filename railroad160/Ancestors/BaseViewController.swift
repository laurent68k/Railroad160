//
//  BaseViewController.swift
//  railroad160
//
//  Created by Laurent Favard on 09/08/2024.
//

import Foundation


import UIKit

class BaseViewController: UIViewController {

    /**
     Retourne VRAI si le mode sombre est actif
     */
    func darkModeEnabled() -> Bool {
    
        return self.traitCollection.userInterfaceStyle == .dark
    }
    
    func delay(delay: Double, closure: @escaping () -> ()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
    
    func toast(forMessage message:String, delay: Double = 1.0) {
        
        let alertMessage  = UIAlertController(title: UIApplication.applicatioDisplayName, message: message, preferredStyle: .alert)
        
        self.present(alertMessage, animated: true, completion: nil)
        self.delay(delay: delay, closure: {
            
            alertMessage.dismiss(animated: true, completion: nil )
        })
    }
}


