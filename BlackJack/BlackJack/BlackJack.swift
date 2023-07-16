//
//  BlackJack.swift
//  BlackJack
//
//  Created by Jeffrey Lin on 7/6/23.
//

import SwiftUI

var dealerTurn = false

struct BlackJack: View {
    @Binding var bet: Int
    @State private var cardList = ["clubs-11", "clubs-02", "clubs-03", "clubs-04", "clubs-05", "clubs-06", "clubs-07", "clubs-08", "clubs-09", "clubs-10", "clubs-J10", "clubs-Q10", "clubs-K10", "diamonds-11", "diamonds-02", "diamonds-03", "diamonds-04", "diamonds-05", "diamonds-06", "diamonds-07", "diamonds-08", "diamonds-09", "diamonds-10", "diamonds-J10", "diamonds-Q10", "diamonds-K10", "hearts-11", "hearts-02", "hearts-03", "hearts-04", "hearts-05", "hearts-06", "hearts-07", "hearts-08", "hearts-09", "hearts-10", "hearts-J10", "hearts-Q10", "hearts-K10", "spades-11", "spades-02", "spades-03", "spades-04", "spades-05", "spades-06", "spades-07", "spades-08", "spades-09", "spades-10", "spades-J10", "spades-Q10", "spades-K10"].shuffled()
    //@State var cardDict: [String: Int] = ["clubs-1" : 1, "clubs-2" : 2, "clubs-3" : 3, "clubs-4": 4, "clubs-5": 5, "clubs-6": 6, "clubs-7" : 7, "clubs-8" : 8, "clubs-9" : 9, "clubs-10": 10, "clubs-11" : 10, "clubs-12" : 10, "clubs-13" : 10, "diamonds-1": 1, "diamonds-2" : 2, "diamonds-3" : 3, "diamonds-4" : 4, "diamonds-5" : 5, "diamonds-6" : 6, "diamonds-7" : 7, "diamonds-8" : 8, "diamonds-9" : 9, "diamonds-10" : 10, "diamonds-11" : 10, "diamonds-12" : 10, "diamonds-13" : 10, "hearts-1" : 1, "hearts-2" : 2, "hearts-3" : 3, "hearts-4" : 4, "hearts-5" : 5, "hearts-6" : 6, "hearts-7" : 7, "hearts-8" : 8, "hearts-9" : 9, "hearts-10" : 10, "hearts-11" : 10, "hearts-12" : 10, "hearts-13" : 10, "spades-1" : 1, "spades-2" : 2, "spades-3" : 3, "spades-4" : 4, "spades-5" : 5, "spades-6" : 6, "spades-7" : 7, "spades-8" : 8, "spades-9" : 9, "spades-10" : 10, "spades-11" : 10, "spades-12" : 10, "spades-13" : 10]
    @State private var randomCard = 0
    @State private var total = 0
    @State private var winner  = ""
    @State private var randex = 0
    @State private var loops: [String] = []
    @State private var turn = true
    @State private var flipped = false
    @State private var gameOver = false
    @State var payout = 0.0
    @State private var isShowing = true
    @State private var showing = true
    @State var unFlipped = ""
    @State var dealerTotal = 0
    @State private var dealerLoops: [String] = []
    @State private var dealerBust = false
    @State private var willFlip = ""
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var busted = false
    @State private var totalShow = false
    let delay = 0.75
    
    func startCards() {
        randex = Int.random(in: 0...51)
        if !cardList.indices.contains(randex) {
            randex = 39
        }
        loops.append(cardList[randex])
        total += Int(cardList[randex].suffix(2).description)!
        cardList.remove(at: randex)
        randex = Int.random(in: 0...51)
        if !cardList.indices.contains(randex) {
            randex = 40
        }
        loops.append(cardList[randex])
        total += Int(cardList[randex].suffix(2).description)!
        cardList.remove(at: randex)
        if total == 21 {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                winner = "BLACKJACK! You"
                gameOver = true
                payout = Double(bet) * 1.5
                busted = true
            }
        }
    }
    
    func dealerCards() {
        randex = Int.random(in: 1...50)
        if !cardList.indices.contains(randex) {
            randex = 41
        }
        unFlipped = "back"
        willFlip = cardList[randex]
        dealerTotal += Int(cardList[randex].suffix(2).description)!
        cardList.remove(at: randex)
        randex = Int.random(in: 1...50)
        if !cardList.indices.contains(randex) {
            randex = 42
        }
        dealerLoops.append(cardList[randex])
        dealerTotal += Int(cardList[randex].suffix(2).description)!
        cardList.remove(at: randex)
        
    }
    
    func Hit() {
        dealerLoops.append(cardList[0])
        dealerTotal += Int(cardList[0].suffix(2).description)!
        cardList.remove(at: 0)
    }
    
    func Stand() {
        dealerTurn = false
        gameOver = true
    }
    
    private func checkForWinner() {
        if total > 21 && dealerTotal < 21 {
            busted = true
            winner = "Dealer"
        } else if total > dealerTotal && total < 21 {
            winner = "You"
        } else if dealerTotal > 21 && total < 21 {
            winner = "You"
        } else if total < dealerTotal && dealerTotal < 21 {
            winner = "Dealer"
        } else if total == dealerTotal {
            winner = "(Push) No one"
        }
        else if dealerTotal == 21 {
            winner = "Dealer"
        }
        else if total == 21 {
            busted = true
            winner = "You"
        }
    }
    
    func runCheck() {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            checkForWinner()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Bet Amount: \(bet)")
                    .font(Font.custom("Marker Felt", size: 32))
                Text("Dealer")
                    .font(Font.custom("Arial", size: 25))
                HStack {
                    Image(unFlipped)
                    //CardsOpponent(type: unFlipped, gameDone: false)
                        .offset(x: -25)
                    ForEach(dealerLoops, id:\.self) {j in
                        HStack {
                            Image(j)
                                .padding(-40)
                                .offset(x: -25)
                        }
                    }
                }
                if totalShow {
                    Text("Dealer Total: \(dealerTotal)")
                        .font(Font.custom("Arial", size: 25)).bold()
                }
                Group {
                    ZStack {
                        VStack {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: 400, height: 10, alignment: .center)
                                .offset(x: 0, y: 8)
                            Rectangle()
                                .foregroundColor(.brown)
                                .frame(width: 400, height: 175, alignment: .center)
                            //.offset(x: 0, y: -25)
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: 400, height: 10, alignment: .center)
                                .offset(x: 0, y: -8)
                        }
                        Image("Stack")
                            .resizable()
                            .frame(width: 400, height: 200, alignment: .center)
                    }
                }
                .offset(y: 50)
                HStack {
                    ForEach(loops, id:\.self) {i in
                        HStack {
                            Image(i)
                            //CardsPlayer(type: i)
                                .padding(-40)
                                .offset(y: 65)
                        }
                    }
                }
                .padding(30)
                Text("Your total: \(total)")
                    .font(Font.custom("Marker Felt", size: 32))
                    .offset(y: 70)
                HStack {
                    Button {
                        if turn && gameOver == false {
                            //randex = Int.random(in: 0...51)
                            loops.append(cardList[0])
                            total += Int(cardList[0].suffix(2).description)!
                            cardList.remove(at: 0)
                        }
                        if total > 21 {
                            if loops.contains("clubs-11") { //if there's an ace
                                loops.remove(at: loops.firstIndex(of: "clubs-11")!)
                                loops.append("clubs-01")
                                total -= 10
                            }
                            else if loops.contains("diamonds-11") {
                                loops.remove(at: loops.firstIndex(of: "diamonds-11")!)
                                loops.append("diamonds-01")
                                total -= 10
                            }
                            else if loops.contains("hearts-11") {
                                loops.remove(at: loops.firstIndex(of: "hearts-11")!)
                                loops.append("hearts-01")
                                total -= 10
                            }
                            else if loops.contains("spades-11") {
                                loops.remove(at: loops.firstIndex(of: "spades-11")!)
                                loops.append("spades-01")
                                total -= 10
                            }
                            else {
                                gameOver = true
                                winner = "(Bust) Dealer"
                                payout = Double(bet * -1)
                                busted = true
                            }
                        }
                    } label: {
                        ZStack {
                            if isShowing {
                                if showing {
                                    Rectangle()
                                        .fill(.green)
                                        .frame(width: 100, height: 50)
                                        .cornerRadius(10)
                                    Text(turn ? "HIT" : "")
                                        .foregroundColor(.white)
                                        .font(Font.custom("Arial", size: 25))
                                        .bold()
                                }
                            }
                        }
                    }
                    .padding(50)
                    Button {
                        turn = false
                        dealerTurn = true
                        for _ in 1..<6 {
                            unFlipped = willFlip
                            if dealerTurn == true && gameOver == false{
                                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                    if dealerTotal <= 16 {
                                        Hit()
                                    }
                                    else if dealerTotal >= 17 && dealerTotal <= 21 {
                                        Stand()
                                    }
                                    else if dealerTotal == 21 {
                                        winner = "Dealer"
                                        gameOver = true
                                    }
                                    else if dealerTotal > 21 {
                                        if dealerLoops.contains("clubs-11") { //if there's an ace
                                            dealerLoops.remove(at: dealerLoops.firstIndex(of: "clubs-11")!)
                                            dealerLoops.append("clubs-01")
                                            dealerTotal -= 10
                                        }
                                        else if dealerLoops.contains("diamonds-11") {
                                            dealerLoops.remove(at: dealerLoops.firstIndex(of: "diamonds-11")!)
                                            dealerLoops.append("diamonds-01")
                                            dealerTotal -= 10
                                        }
                                        else if dealerLoops.contains("hearts-11") {
                                            dealerLoops.remove(at: dealerLoops.firstIndex(of: "hearts-11")!)
                                            dealerLoops.append("hearts-01")
                                            dealerTotal -= 10
                                        }
                                        else if dealerLoops.contains("spades-11") {
                                            dealerLoops.remove(at: dealerLoops.firstIndex(of: "spades-11")!)
                                            dealerLoops.append("spades-01")
                                            dealerTotal -= 10
                                        }
                                        else {
                                            gameOver = true
                                            winner = "You"
                                            busted = true
                                        }
                                    }
                                }
                            }
                        }
                        runCheck()
                        isShowing.toggle()
                        totalShow.toggle()
                    } label: {
                        ZStack {
                            if isShowing {
                                if showing {
                                    Rectangle()
                                        .fill(.red)
                                        .frame(width: 100, height: 50)
                                        .cornerRadius(10)
                                    Text(turn ? "STAND" : "")
                                        .foregroundColor(.white)
                                        .font(Font.custom("Arial", size: 25))
                                        .bold()
                                }
                            }
                        }
                    }
                }
                .padding()
                .offset(x: -20)
                //NavigationLink(destination: Text("Destination"), isActive: $gameOver) { EmptyView() }
            }
            .onAppear {
                startCards()
                dealerCards()
                cardList.shuffle()
            }
            .onDisappear() {
                cardList.shuffle()
                cardList.reverse()
            }
            
            .background(
                Image("green")
                    .resizable()
                    .frame(width: 600, height: 1000)
                    .ignoresSafeArea()
            )
        }
        .alert(Text("\(winner) won!"), isPresented: $gameOver) {
            Button("Play Again", role: .destructive, action: homePage)
        }
    }
    
    func homePage() {
        ContentView()
        dismiss()
    }
}

struct CardsPlayer: View {
    let type: String
    @State private var delay = 0.3
    @State private var isFlipped = false
    @State private var frontDegree = -90.0
    @State private var backDegree = 0.0
    @State private var totalP = 0
    
    func flipCard() {
        if isFlipped == false{
            withAnimation(.linear(duration: delay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: delay)) {
                frontDegree = 0
            }
            isFlipped = true
            
        }
    }
    var body: some View {
        VStack {
            ZStack {
                Image(type)
                    .frame(width: 120, height: 162)
                    .rotation3DEffect(Angle(degrees: frontDegree), axis: (x: 0, y: 1, z: 0))
                Image("back")
                    .frame(width: 120, height: 162)
                    .rotation3DEffect(Angle(degrees: backDegree), axis: (x: 0, y: 1, z: 0))
            }
            .onTapGesture {
                flipCard()
            }
        }
    }
}

struct CardsOpponent: View {
    let type: String
    @State private var delay = 0.3
    @State private var isFlipped = false
    @State private var frontDegree = -90.0
    @State private var backDegree = 0.0
    //@State var gameDone = false
    
    func flipCard() {
        if isFlipped == false{ //&& gameDone == true {
            withAnimation(.linear(duration: delay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: delay)) {
                frontDegree = 0
            }
            isFlipped = true
        }
    }
    var body: some View {
        VStack {
            ZStack {
                Image(type)
                    .frame(width: 120, height: 162)
                    .rotation3DEffect(Angle(degrees: frontDegree), axis: (x: 0, y: 1, z: 0))
                Image("back")
                    .frame(width: 120, height: 162)
                    .rotation3DEffect(Angle(degrees: backDegree), axis: (x: 0, y: 1, z: 0))
            }
        }
        .onTapGesture {
            flipCard()
        }
        //.onChange(of: gameDone, perform: { newValue in
        //   flipCard()
        //})
    }
}

//struct BlackJack_Previews: PreviewProvider {
//   static var previews: some View {
//        BlackJack()
//    }
//}
