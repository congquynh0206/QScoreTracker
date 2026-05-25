//
//  AddPlayerSheetView.swift
//  QScoreTracker
//
//  Created by Nguyen Cong Quynh on 23/5/26.
//
import SwiftUI

struct AddPlayerSheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var playerToEdit : Player?
    @State private var name: String = ""
    @State private var selectedColor: String = ColorBoard.blue
    @State private var initialScore : Int = 0
    @ObservedObject var vm : HomeViewModel
    
    @FocusState private var isInputActive: Bool
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Spacer()
            HStack{
                Text(playerToEdit != nil ? "Chỉnh sửa người chơi" : "Thêm người chơi mới")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Spacer()
                Button{
                    dismiss()
                }label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 24))
                        .foregroundColor(Color(.systemGray3))
                }
                .buttonStyle(.plain)
                .padding(.top, 10)
                
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 5){
                Text ("TÊN NGƯỜI CHƠI: ")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.secondary)
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(.gray)
                    TextField("Nhập tên", text: $name)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 10){
                Text ("MÀU SẮC: ")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.secondary)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(ColorBoard.colors, id: \.self) { color in
                            ZStack {
                                Circle()
                                    .fill(Color(hex: color))
                                    .frame(width: 40, height: 40)
                                    .onTapGesture {
                                        selectedColor = color
                                    }
                                
                                if selectedColor == color {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .bold))
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 5){
                Text ("ĐIỂM SỐ: ")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.secondary)
                HStack {
                    Button { initialScore -= 1 } label: {
                        Image(systemName: "minus")
                            .foregroundColor(.gray)
                            .frame(width: 20, height: 20)
                    }
                    
                    Spacer()
                    
                    TextField("0", value: $initialScore, format: .number)
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                        .focused($isInputActive)
                        .keyboardType(.numberPad)
                        .frame(minWidth: 60)
                    Spacer()
                    
                    Button { initialScore += 1 } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.gray)
                            .frame(width: 20, height: 20)
                    }
                    
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
            }
            .padding()
            
            VStack{
                Button ("Xong") {
                    if let player = playerToEdit {
                        vm.updatePlayer(id: player.id, name: name, score: initialScore, color: selectedColor)
                    } else {
                        vm.addPlayer(name: name, score: initialScore, color: selectedColor)
                    }
                    dismiss()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .cornerRadius(12)
                .disabled(name.isEmpty)
                .opacity(name.isEmpty ? 0.5 : 1)
            }
            .padding()
 
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.white)
        .toolbar {
            ToolbarItemGroup (placement: .keyboard){
                Spacer()
                Button("Xong"){
                    isInputActive = false
                }
            }
        }
        .onAppear(){
            if let player = playerToEdit {
                name = player.name
                selectedColor = player.color
                initialScore = player.score
            }
        }
    }
}

#Preview {
    AddPlayerSheetView(vm: HomeViewModel()
    )
}
