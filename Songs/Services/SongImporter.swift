//
//  FileImporter.swift
//  TestApp
//
//  Created by Gary Milligan on 28/07/2021.
//

import Foundation

struct Song: Codable {
    let position: String
    let artistTitle: String
    let songTitle: String
}

final class SongImporter {
    
    func loadSongs(completion: @escaping (Result<[Song], Error>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            do {
                let decoder = JSONDecoder()
                let data = try self?.loadDataFromFile(with: "songs")
                let songsResponse = try decoder.decode([Song].self, from: data!)
                completion(.success(songsResponse))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    private func loadDataFromFile(with name: String) throws -> Data? {
        guard let filePath = Bundle.main.path(forResource: name, ofType: "json"),
              let data = try String(contentsOfFile: filePath).data(using: .utf8) else {
            return nil
        }
        return data
    }
}
