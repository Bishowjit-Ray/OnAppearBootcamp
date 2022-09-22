//
//  ContentView.swift
//  OnAppearBootcamp
//
//  Created by Bishowjit Ray on 22/9/22.
//

import SwiftUI

struct ContentView: View {
    @State var myText: String = "Start text"
    @State var count: Int = 0
    var body: some View {
        
        NavigationView{
            ScrollView {
                Text(myText)
                LazyVStack{
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 300)
                            .padding()
                            .onAppear{
                                count += 1
                                
                            }
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    myText = "This is the new text"
                }
            })
            .onDisappear(perform: {
                myText = "Ending text"
            })
            
            .navigationTitle("On Appear: \(count)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
