//
//  ViewController.swift
//  railroad160
//
//  Created by Laurent Favard on 08/08/2024.
//

import UIKit

class MainViewController: BaseViewController {

    @IBOutlet weak var aboutItem: UIBarButtonItem!
    @IBOutlet var settingsItem: UIBarButtonItem!
    
    private var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        self.toast(forMessage: self.darkModeEnabled() ? "mode sombre" : "mode clair")
        
        self.settingsItem.setFAIcon(icon: .FACogs, iconSize: 30, color: .label)
        self.aboutItem.setFAIcon(icon: .FAInfoCircle, iconSize: 30, color: .label)
    }
    
    //  -----------------------------------------------------------------------------------------------
    
    //  Déclenchée par l'action des segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //  Ouverture du controlleur Settings
        if segue.identifier == "showSettingsSegue" {
            
            if let viewController = segue.destination as? SettingsViewController {
                                
                viewController.viewModel = self.viewModel
            }
        }
    }

    // Unwind segue: Called only when SettingsViewController is closed by Ok button. Cancel perform a dismiss (No segue)
    @IBAction func backToMainViewController(_ sender:UIStoryboardSegue) {
        
        if let viewController = sender.source as? SettingsViewController {
            
            
        }
    }
    
    //  -----------------------------------------------------------------------------------------------
    
    @IBAction func buttonTestAction(_ sender: UIButton) {
        
        self.toast(forMessage: "button clicked")
    }
    
    @IBAction func aboutItemAction(_ sender: UIBarButtonItem) {

        self.toast(forMessage: "about me")
    }
}

