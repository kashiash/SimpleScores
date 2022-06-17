//
//  ScoreRow.swift
//  SimpleScores
//
//  Created by Jacek on 17/06/2022.
//

import SwiftUI

struct ScoreRow: View {
    @Binding var item: Score

    var body: some View {
        HStack(spacing: 10) {
            Button {
                item.score -= 1
            } label: {
                Image(systemName: "minus")
                    .font(.title3.weight(.black))
                    .frame(minWidth: 44, minHeight: 44)
                    .contentShape(Rectangle())
            }

            TextField("Player name", text: $item.playerName)
                .font(.title.weight(.black))
                .minimumScaleFactor(0.75)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(String(item.score))
                .font(.title.weight(.black))

            Button {
                item.score += 1
            } label: {
                Image(systemName: "plus")
                    .font(.title3.weight(.black))
                    .frame(minWidth: 44, minHeight: 44)
                    .contentShape(Rectangle())
            }
        }
        .padding(10)
        .animation(nil, value: item)
        .background(Color(item.color.rawValue))
        .listRowSeparator(.hidden)
    }
}
struct ScoreRow_Previews: PreviewProvider {
    static var previews: some View {
        ScoreRow(item: .constant(.example))
    }
}
