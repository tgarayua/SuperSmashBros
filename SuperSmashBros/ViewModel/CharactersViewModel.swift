//
//  CharactersViewModel.swift
//  SuperSmashBros
//
//  Created by Thomas Garayua on 8/14/23.
//

import Foundation

class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    
    func fetchCharactersVM() {
        NetworkManager.shared.fetchCharacters { [weak self] character in
            DispatchQueue.main.async {
                self?.characters = character ?? []
            }
        }
    }
}
