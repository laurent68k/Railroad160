//
//  SettingsViewController.swift
//  railroad160
//
//  Created by Laurent Favard on 09/08/2024.
//

import Foundation
import UIKit

class SettingsViewController: BaseViewController {
 
    public var viewModel : Railroad160RemoteProcessor? = nil
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true)
    }
    
    @IBAction func builtinLedOff(_ sender: UIButton) {
        
        self.viewModel?.builtinLedOff()
    }
    
    @IBAction func builtinLedOn(_ sender: UIButton) {

        self.viewModel?.builtinLedOn()
    }
    
    @IBAction func autotest(_ sender: UIButton) {

        self.viewModel?.autoTest()
    }

    @IBAction func relaysWrite(_ sender: UIButton) {

        self.viewModel?.relays()
    }
    
}
