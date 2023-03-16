//
//  ContentView.swift
//  SuperSmashBros
//
//  Created by Thomas Garayua on 3/15/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var viewModel = SuperSmashBrosViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
        }
        .onAppear{
            viewModel.getDataFromApi()
            print(viewModel.list)
        }
        .padding()
    }
}
