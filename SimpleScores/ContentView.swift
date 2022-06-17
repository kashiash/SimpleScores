//
//  ContentView.swift
//  SimpleScores
//
//  Created by Jacek on 17/06/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: ViewModel
    @State private var showingClearAlert = false

    var body: some View {
        List {
            ForEach($model.items, content: ScoreRow.init)
                .onDelete(perform: model.delete)

            Button(action: model.add) {
                Label("Add Player", systemImage: "plus")
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .contentShape(Rectangle())
            }
            .disabled(model.items.count == ColorChoice.allCases.count)
            .listRowSeparator(.hidden)
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button{
                    showingClearAlert = true
                } label: {
                    Label ("Remove All",systemImage: "trash")
                }
                .disabled(model.items.isEmpty)
                           
            }
        }
        .animation(.default, value: model.items)
        .navigationTitle("SimpleScores")
        .listStyle(.plain)
        .buttonStyle(.plain)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: ViewModel())
    }
}
