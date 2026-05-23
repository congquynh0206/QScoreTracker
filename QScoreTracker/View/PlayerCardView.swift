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
                    .foregroundColor(Color(hex: player.color))
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "xmark")
                    .foregroundColor(Color(hex: player.color))
            }.padding()
            HStack {
                Button (action: {onChangeScore(-1)}){
                    Image(systemName: "minus")
                        .padding()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color(hex: player.color))
                        .background(
                            Circle()
                                .fill(Color(hex: player.color).opacity(0.2))
                                .overlay(
                                    Circle().stroke(Color(hex: player.color).opacity(0.5), lineWidth: 1)
                                )
                        )
                }
                
                Spacer()
                
                Text("\(player.score)")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(Color(hex: player.color))
                
                Spacer()
                
                Button (action: {onChangeScore(1)}){
                    Image(systemName: "plus")
                        .padding()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(Circle().fill(Color(hex: player.color).opacity(0.8)))
                }
            }
            
            HStack {
                Button ("-2") { onChangeScore(-2) }
                    .tint(Color(hex: player.color))
                
                Button ("-3") { onChangeScore(-3) }
                    .tint(Color(hex: player.color))
                
                Spacer()
                
                Button ("+2") { onChangeScore(2) }
                    .tint(Color(hex: player.color)) 
                
                Button ("+3") { onChangeScore(3) }
                    .tint(Color(hex: player.color))
            }
            .buttonStyle(.bordered)
            .controlSize(.small)
        }
        .padding()
        .background(Color(hex: player.color).opacity(0.05))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
    }
}


