//
//  MenuViewController.swift
//  Songs
//
//  Created by Gary Milligan on 30/07/2021.
//

import UIKit

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapSongList(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "SongListTableViewController")
        self.show(viewController, sender: self)
    }
}
