//
//  ContentView.swift
//  HACKER
//
//  Created by SHUBHAM KUMAR on 23/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url))
                {
                    HStack{
                        Text(String(post.points))
                            .foregroundColor(.blue)
                            .font(Font.custom("Langar-Regular", size: 22))
                            .bold()
                            .padding()
                        
                        Text(post.title)
                            .font(Font.custom("Langar-Regular", size: 22))
                    }
                }
                
            }
//            .navigationBarTitle("HACKER NEWS")
            
//            Custom NAVIGATION BAR TITLE
            .navigationBarTitleDisplayMode(.inline)
                   .toolbar {
                       ToolbarItem(placement: .principal) {
                           HStack {
                               Image(systemName: "sun.min.fill")
                                .foregroundColor(.yellow)
                            Text("HACKER NEWS").font(.headline).bold()
                                .foregroundColor(.green)
                            Image(systemName: "newspaper")
                                .foregroundColor(.red)
                           }
                       }
                   }
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
