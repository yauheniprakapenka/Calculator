//
//  About.swift
//  Calculator
//
//  Created by yauheni prakapenka on 16/02/2019.
//

import UIKit

extension AboutViewController {
    
    struct Constants {
        static let versionNumber = "CFBundleShortVersionString"
        static let buildNumber = "CFBundleVersion"
    }
}

class AboutViewController: UIViewController {

    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var versionLabel: UILabel!
    
    @IBAction func closeButtonDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutView.layer.cornerRadius = 10
        aboutView.layer.masksToBounds = true
        versionLabel.text = versionApp()
    }
    
    func versionApp() -> String {
        let version = Bundle.main.infoDictionary?[Constants.versionNumber]
        let build = Bundle.main.infoDictionary?[Constants.buildNumber]
        return "\(version ?? "0")(\(build ?? "0"))\(" Alpha")"
    }
}


