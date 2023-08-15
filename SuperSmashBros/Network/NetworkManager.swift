//
//  NetworkManager.swift
//  SuperSmashBros
//
//  Created by Thomas Garayua on 8/14/23.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let superSmashBrothersApiUrl = "https://smashbros-unofficial-api.vercel.app/api/v1/ultimate/characters"
    private init() {}
    
    func fetchCharacters(completion: @escaping ([Character]?) -> Void) {
        guard let url = URL(string: superSmashBrothersApiUrl) else {
            print("Unable to find Super Smash Bros API url")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("error present in URLSession: ", error.localizedDescription)
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let characters = try decoder.decode([Character].self, from: data)
                    completion(characters)
                } catch {
                    print("error present in data's catch statement", error.localizedDescription)
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
