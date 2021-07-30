//
//  SongListTableViewController.swift
//  Songs
//
//  Created by Gary Milligan on 30/07/2021.
//

import UIKit

class SongListTableViewController: UIViewController {
    
    let viewModel = SongListViewModel()

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            
            tableView.dataSource = self
            
            let nib = UINib(nibName: "SongTableViewCell", bundle: .main)
            tableView.register(nib, forCellReuseIdentifier: "SongTableViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadSongs { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension SongListTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongTableViewCell", for: indexPath) as! SongTableViewCell
        
        let song = viewModel.songs[indexPath.row]
        cell.titleLabel.text = song.songTitle
        cell.artistLabel.text = song.artistTitle
        
        return cell
    }
}
