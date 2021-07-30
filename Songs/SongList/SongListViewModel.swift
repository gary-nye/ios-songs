//
//  SongListViewModel.swift
//  TestApp
//
//  Created by Gary Milligan on 28/07/2021.
//

import Foundation

final class SongListViewModel {
    
    private let importer = SongImporter()
    var songs: [Song] = []
    
    func loadSongs(completion: @escaping () -> Void) {
        self.importer.loadSongs { result in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                switch result {
                case let .success(songs):
                    self.songs = songs
                    completion()
                case .failure:
                    print("Could not load songs")
                }
            }
        }
    }
}
