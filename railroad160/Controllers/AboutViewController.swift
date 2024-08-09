//
//  AboutViewController.swift
//  railroad160
//
//  Created by Laurent Favard on 09/08/2024.
//

import Foundation
import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var versionTextLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appNameLabel.text = UIApplication.applicatioDisplayName
        self.versionTextLabel?.text = UIApplication.applicationBuildVersion
        
        
    }
    
}
