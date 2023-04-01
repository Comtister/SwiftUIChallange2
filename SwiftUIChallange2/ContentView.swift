//
//  ContentView.swift
//  SwiftUIChallange2
//
//  Created by Oguzhan Ozturk on 28.03.2023.
//

import SwiftUI

enum GameIcons: String, CaseIterable {
    case rock, paper, scissor
}

enum ArrowDirect {
    case left, rigth
}

struct ContentView: View {
    
    @State private var gameIndex = Int.random(in: 0...2)
    @State private var userIndex = 1
    @State private var turnValue = 0
    @State private var point = 0
    @State var randomInt = Int.random(in: 0...1)
    
    var body: some View {
        VStack {
            Text("Point: \(point)")
            HStack {
                Text("Turn: ")
                Text("\(turnValue)")
            }
            Text(randomInt == 0 ? "Goal: Lose" : "Goal: Win")
            Image(GameIcons.allCases[gameIndex].rawValue)
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3))
            Image("swords")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
            HStack {
                Button(action: {
                    changeItem(direct: .left)
                }, label: {
                    Image("leftarrow")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                })
                Image(GameIcons.allCases[userIndex].rawValue)
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3))
                Button(action: {
                    changeItem(direct: .rigth)
                }, label: {
                    Image("rightarrow")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                })
            }
            Spacer()
                .frame(height: 50)
            Button("Action") {
                gameAction()
            }
            .buttonStyle(BasicButtonStyle())
            Spacer()
        }
    }
    
    private func changeItem(direct: ArrowDirect) {
        
        if direct == .rigth && userIndex == GameIcons.allCases.count - 1 {
            userIndex = 0
        } else if direct == .left && userIndex == 0 {
            userIndex = GameIcons.allCases.count - 1
        } else if direct == .rigth {
            userIndex += 1
        } else if direct == .left {
            userIndex -= 1
        }
        
    }
    
    private func gameAction() {
        
        switch userIndex {
        case 0:
            if gameIndex == 2 && randomInt == 1 {
                point += 1
                break
            }
            if gameIndex != 2 && randomInt == 0 {
                point += 1
            }
        case 1:
            if gameIndex == 0 && randomInt == 1 {
                point += 1
                break
            }
            if gameIndex != 0 && randomInt == 0 {
                point += 1
            }
        case 2:
            if gameIndex == 1 && randomInt == 1 {
                point += 1
                break
            }
            if gameIndex != 1 && randomInt == 0 {
                point += 1
            }
        default:
            break
        }
        turnValue += 1
        randomInt = Int.random(in: 0...1)
        gameIndex = Int.random(in: 0...2)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
