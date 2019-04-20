//
//  SettingViewController.swift
//  Calculator
//
//  Created by yauheni prakapenka on 09/03/2019.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var leafRightImageView: UIImageView!
    @IBOutlet weak var leafMiddleImageView: UIImageView!
    @IBOutlet weak var leafLeftImageView: UIImageView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var dropLeafOnCatButton: UIButton!
    
    let progress = Progress(totalUnitCount: 3)
    
    var countDropALeafButton: Int = 0
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBAction func ButtonDidTap(_ sender: Any) {
        let alertController = UIAlertController(title: "Hello World", message: "This is a text", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Done", style: .default, handler: nil)
        
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func dropLeafOnCatButtonTapped(_ sender: UIButton) {
        countDropALeafButton += 1
        
        if countDropALeafButton == 1 {
            UIView.animate(withDuration: 3.4, delay: 0.4, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.leafRightImageView.center.y = self.view.bounds.height - 112
            }, completion: nil)
        } else if countDropALeafButton == 2 {
            UIView.animate(withDuration: 3.4, delay: 0.4, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.leafLeftImageView.center.y = self.view.bounds.height - 53
            }, completion: nil)
        } else if countDropALeafButton == 3 {
            UIView.animate(withDuration: 3.4, delay: 0.4, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.leafMiddleImageView.center.y = self.view.bounds.height - 104
            }, completion: nil)
        }
        self.progress.completedUnitCount += 1
    }
}
