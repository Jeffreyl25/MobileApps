//
//  ContentView.swift
//  BlackJack
//
//  Created by Jeffrey Lin on 7/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var betAmount = 0
    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                    .ignoresSafeArea()
                VStack {
                    Text("Casual BlackJack")
                        .font(Font.custom("Marker Felt", size: 50))
                        .multilineTextAlignment(.center)
                        .offset(y:20)
                    Text("Click the chip that you want to bet (you can stack as many chips as you like)")
                        .font(Font.custom("Marker Felt", size: 25))
                        .offset(y:20)
                        .frame(width: 400, height: 100, alignment: .center)
                    Text("Click Reset bet to Play Again!")
                        .font(Font.custom("Marker Felt", size: 25))
                        .frame(width: 400, height: 100, alignment: .center)
                    HStack {
                        Group{
                            Button {
                                betAmount += 1
                            } label: {
                                Image("1Chip")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .offset(x: 10, y: 0)
                            }
                            Button {
                                betAmount += 3
                            } label: {
                                Image("3Chip")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .offset(x: -10 ,y: 0)
                            }
                        }
                    }
                    HStack {
                        Group {
                            Button {
                                betAmount += 25
                            } label: {
                                Image("25Chip")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .offset(x: 10, y: -50)
                            }
                            Button {
                                betAmount += 200
                            } label: {
                                Image("200Chip")
                                    .resizable()
                                    .frame(width: 130, height: 200)
                                    .offset(x: -10, y: -50)
                            }
                        }
                    }
                    Text("\(betAmount)")
                        .font(Font.custom("Arial", size: 30))
                        .offset(y: -60)
                    NavigationLink("Deal", destination: BlackJack(bet: $betAmount))
                        .font(Font.custom("Marker Felt", size: 50))
                        .offset(x:0, y: -50)
                    Button {
                        betAmount = 0
                    } label: {
                        Text("Reset Bet")
                            .font(.title).bold()
                            .foregroundColor(.white)
                    }
                    .offset(y: -40)
                    NavigationLink("How to Play", destination: InstructionsView())
                        .font(Font.custom("Marker Felt", size: 30))
                        .offset(y: -25)
                        .foregroundColor(.red)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct InstructionsView: View {
    var body: some View {
        ZStack {
            Color.green.opacity(0.7).ignoresSafeArea()
            VStack {
                Image("Blackjack")
                    .resizable()
                    .frame(width: 400, height: 400, alignment: .center)
                    .offset(y: -70)
                Text("The Game of BlackJack")
                    .font(Font.custom("Marker Felt", size: 35)).bold()
                    .offset(y: -70)
                Group {
                    Text("In BlackJack, there are two people to focus on; you, and the dealer. The dealer deals 2 cards to everyone(including them). The goal of BlackJack is to get as close to 21 as you can without going over")
                    Text("Once you get your cards, you are able to see the one of the dealers cards and choose if you want to \"Hit\" or \"Stand\". Hit means that the dealer gives you another card and Stand means you want to stay.")
                    Text("Once you stand, Your cards are compared to the dealers cards to see which is closer to 21. Aces are worth 11, however, if the total is greater than 21, Aces can also be worth 1. Jacks, Queens, and Kings are all worth 10. The name of the game is to get closer to 21 than the dealer.")
                }
                .font(Font.custom("Arial", size: 15)).bold()
                .offset(y: -50)
                .frame(width: 375)
            }
        }
    }
}
