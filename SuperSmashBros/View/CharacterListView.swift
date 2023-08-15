//
//  CharacterListView.swift
//  SuperSmashBros
//
//  Created by Thomas Garayua on 8/14/23.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject var viewModel = CharactersViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                if viewModel.characters.isEmpty {
                    ProgressView()
                } else {
                    List(viewModel.characters, id: \.order) { character in
                        
                        NavigationLink(destination: CharacterDetailView(character: character)) {
                            HStack {
                                ZStack {
                                    AsyncImage(url: URL(string: character.images.icon), scale: 2) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            
                                    } placeholder: { ProgressView("Loading...").progressViewStyle(.circular) }
                                        .frame(width: 150, height: 150)
                                }
                            }
                            Text(character.name)
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                                .padding()
                        }
                        .listRowSeparator(.hidden)
                    }
                }
            }
            .navigationTitle("Super Smash Bros")
        }
        .onAppear {
            viewModel.fetchCharactersVM()
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
