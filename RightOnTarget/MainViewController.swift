//
//  MainViewController.swift
//  RightOnTarget
//
//  Created by Нюргун on 05.05.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var colorGameButton: UIButton!
    @IBOutlet weak var numberGameButton: UIButton!
    
    override func viewDidLoad() {
    }
    
    @IBAction func colorGameButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier:
        "ColorViewController")
        self.present(viewController, animated: true, completion: nil)
    }
    @IBAction func numberGameButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier:
        "NumberViewController")
        self.present(viewController, animated: true, completion: nil)
    }
}
