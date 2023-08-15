//
//  CharacterDetailView.swift
//  SuperSmashBros
//
//  Created by Thomas Garayua on 8/14/23.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        HStack {
            ZStack {
                AsyncImage(url: URL(string: character.images.portrait), content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        
                }, placeholder: {ProgressView("Loading...")})
            }
        }
    }
}

//struct CharacterDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterDetailView(character: <#T##Character#>)
//    }
//}
