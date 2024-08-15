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
    @IBOutlet weak var refreshItem: UIBarButtonItem!
    @IBOutlet weak var railroadmap: UIImageView!
    
        
    @IBOutlet weak var turnout1: UIButton!
    
    @IBOutlet weak var turnout2: UIButton!
    
    @IBOutlet weak var turnout1Leading: NSLayoutConstraint!
    @IBOutlet weak var turnout1Top: NSLayoutConstraint!
    
    @IBOutlet weak var turnout2Leading: NSLayoutConstraint!
    
    @IBOutlet weak var turnout2Top: NSLayoutConstraint!
    private var viewModel = Railroad160RemoteProcessor.shared

    override func viewDidLoad() {
        
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(self.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        self.getRelaysStatus()
    }

    /**
     Appelée lorsque le mode clair/sombre a été basculé sur iOS. L'application peut s'adapter si besoin.
     */
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        self.toast(forMessage: self.darkModeEnabled() ? "mode sombre" : "mode clair")
        
        self.settingsItem.setFAIcon(icon: .FACogs, iconSize: 30, color: .label)
        self.aboutItem.setFAIcon(icon: .FAInfoCircle, iconSize: 30, color: .label)
        self.refreshItem.setFAIcon(icon: .FARefresh, iconSize: 30, color: .label)
    }
    
    //  On device screen orientation change: Re-calculate the layout for the collection view
    @objc private func rotated() {
        
        self.toast(forMessage: "rotate")
        
        if UIDevice.current.orientation.isLandscape {

            self.turnout1Leading = self.turnout1Leading.setMultiplier(multiplier: 1.3)
            self.turnout1Top = self.turnout1Top.setMultiplier(multiplier: 1.7)

            self.turnout2Leading = self.turnout2Leading.setMultiplier(multiplier: 1.3)
            self.turnout2Top = self.turnout2Top.setMultiplier(multiplier: 0.1)
        }
        else {

            self.turnout1Leading = self.turnout1Leading.setMultiplier(multiplier: 1.3)
            self.turnout1Top = self.turnout1Top.setMultiplier(multiplier: 1.35)

            self.turnout2Leading = self.turnout2Leading.setMultiplier(multiplier: 1.3)
            self.turnout2Top = self.turnout2Top.setMultiplier(multiplier: 0.55)
}
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
            
            self.getRelaysStatus()
        }
    }
        
    @IBAction func refreshRelaysStatus(_ sender: UIBarButtonItem) {
        
        self.getRelaysStatus()
    }
    
    @IBAction func turnout1Action(_ sender: UIButton)  {
        
        self.toast(forMessage: "turnout 1 action")
    }
        
    @IBAction func turnout2Action(_ sender: UIButton) {
        
        self.toast(forMessage: "turnout 2 action")
    }
    
    //  -----------------------------------------------------------------------------------------------

    func getRelaysStatus() {
        
        self.toast(forMessage: "Reading status of the railroad")
        self.viewModel.getRelays(onCompletion: { response in
            
            print(response)
        })
    }
}

