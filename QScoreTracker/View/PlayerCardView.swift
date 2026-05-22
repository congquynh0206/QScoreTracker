//
//  PlayerCardView.swift
//  QScoreTracker
//
//  Created by Nguyen Cong Quynh on 21/5/26.
//
import SwiftUI

struct PlayerCardView: View {
    let player: Player
    var onChangeScore :  (Int) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(player.name)
                Spacer()
                Image(systemName: "xmark")
            }.padding()
            HStack {
                Button (action: {onChangeScore(-1)}){
                    Image(systemName: "minus")
                        .padding()
                        .background(Circle().fill(Color.gray.opacity(0.1)))
                }
                
                Spacer()
                
                Text("\(player.score)")
                    .font(.system(size: 60, weight: .bold))
                
                Spacer()
                Button (action: {onChangeScore(1)}){
                    Image(systemName: "plus")
                        .padding()
                        .background(Circle().fill(Color.gray.opacity(0.1)))
                }
            }
            
            HStack {
                Button ("-2") {onChangeScore(-2)}
                Button ("-3") {onChangeScore(-3)}
                Spacer()
                Button ("+2") {onChangeScore(2)}
                Button ("+3") {onChangeScore(3)}
            }
            .buttonStyle(.bordered)
            .controlSize(.small)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
    }
}


