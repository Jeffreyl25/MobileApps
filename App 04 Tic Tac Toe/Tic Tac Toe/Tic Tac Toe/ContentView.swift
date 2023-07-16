//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Jeffrey Lin on 6/30/23.
//

import SwiftUI
import ConfettiSwiftUI

struct ContentView: View {
    @State private var counter = 0
    @State private var moves = Array(repeating: "", count: 9)
    @State private var xTurn = true
    @State private var gameOver = false
    @State private var winMessage = ""
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.title).bold()
                .padding()
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(120)), count: 3), spacing: 15) {
                ForEach(0..<9) { index in
                    ZStack {
                        Color.blue
                        Color.gray
                            .opacity(moves[index] == "" ? 1 : 0)
                        Text(moves[index])
                            .font(.system(size: 90))
                            .fontWeight(.heavy)
                    }
                    .frame(width: 120, height: 120, alignment: .center)
                    .cornerRadius(30)
                    .onTapGesture {
                        withAnimation(.default) {
                            if moves[index] == "" {
                                moves[index] = xTurn ? "X" : "O"
                                xTurn.toggle()
                            }
                        }
                    }
                    .rotation3DEffect(.init(degrees: moves[index] != "" ? 180 : 0), axis: (x: 0.0, y: 1.0, z: 0.0))
                }
            }
            Button(action: {
                counter += 1
            }) {
                Text("")
            }
            .confettiCannon(counter: $counter,num: 50, openingAngle: Angle(degrees: 0), radius: 500.0)
        }
        .preferredColorScheme(.dark )
        .alert(isPresented: $gameOver) {
            Alert(title: Text(winMessage), dismissButton: .destructive(Text("Play again"), action: {
                withAnimation {
                    moves = Array(repeating: "", count: 9)
                    gameOver = false
                    xTurn = true
                    if winMessage != "Cat's Game"{
                        counter += 1
                    }
                }
            }))
        }
        .onChange(of: moves) { newValue in checkForWinner()
            if !(gameOver || moves.contains("")) {
                winMessage = "Cat's Game"
                gameOver = true
            }
        }
    }
    
    private func checkForWinner() {
        checkLine(a: 0, b: 1, c: 2) // top line
        checkLine(a: 3, b: 4, c: 5) // middle line
        checkLine(a: 6, b: 7, c: 8) // bottom line
        
        checkLine(a: 0, b: 3, c: 6) // left line
        checkLine(a: 1, b: 4, c: 7) // middle line
        checkLine(a: 2, b: 5, c: 8) // right line
        
        checkLine(a: 0, b: 4, c: 8) // diagonal
        checkLine(a: 2, b: 4, c: 6) // diagonal
    }

    private func checkLine(a: Int, b: Int, c:Int) {
        if moves[a] != "" && moves[a] == moves[b] && moves[b] == moves[c] {
            winMessage = "\(moves[a]) is the winner!"
            gameOver = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
