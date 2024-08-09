//
//  SettingsViewController.swift
//  railroad160
//
//  Created by Laurent Favard on 09/08/2024.
//

import Foundation
import UIKit

class SettingsViewController: BaseViewController {
 
    public var viewModel : MainViewModel? = nil
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true)
    }
    
    @IBAction func builtinLedOff(_ sender: UIButton) {
        
        self.viewModel?.ledOff()
    }
    
    @IBAction func builtinLedOn(_ sender: UIButton) {

        self.viewModel?.ledOn()
    }
}
