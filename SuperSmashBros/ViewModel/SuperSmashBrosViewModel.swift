//
//  SuperSmashBrosViewModel.swift
//  SuperSmashBros
//
//  Created by Thomas Garayua on 3/16/23.
//

import Foundation
import Combine

class SuperSmashBrosViewModel: ObservableObject {
    
    @Published var list: Character = []
    
    
    func getDataFromApi(){
        // Start an async task
        Task {
            
            do {
                
                let characters = try await CharacterFetcher.fetchCharacterWithAsyncURLSession()
                
                // Update collection view content
                DispatchQueue.main.async {
                    self.list = characters
                }
                
            } catch {
                print("Request failed with error: \(error)")
            }
            
        }
    }
    
}

struct CharacterFetcher {
    
    enum CharacterFetcherError: Error {
        case invalidURL
        case missingData
    }
    
    static func fetchCharacterWithAsyncURLSession() async throws -> Character {

        guard let url = URL(string: "https://smashbros-unofficial-api.vercel.app/api/v1/ultimate/characters") else {
            throw CharacterFetcherError.invalidURL
        }

        // Use the async variant of URLSession to fetch data
        // Code might suspend here
        let (data, _) = try await URLSession.shared.data(from: url)

        // Parse the JSON data
        let charactersResult = try JSONDecoder().decode(Character.self, from: data)
        return charactersResult
    }
    
}
