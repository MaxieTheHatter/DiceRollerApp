//
//  ContentView.swift
//  DiceRollerApp
//
//  Created by Max Nelson on 2025-10-19.
//

import SwiftUI

struct ContentView: View {
    let diceTypes = ["D4", "D6", "D8", "D10", "D12", "D20"]
    let numberOfDiceOptions = ["1", "2", "3", "4", "5", "6", "7", "8"]
    @State private var selectedDiceType = "D6"
    @State private var numberOfDice = "1"
    @State private var result = ""
    var body: some View {
        VStack {
            Image(systemName: "die.face.6.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(radius: 8)
                .padding()

            Text("Type of Dice")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .shadow(radius: 8)
                .padding(.bottom, 2)

            Picker("", selection: $selectedDiceType) {
                ForEach(diceTypes, id: \.self) { type in
                    Text(type)
                }
            }

            Text("Number of Dice")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .shadow(radius: 8)
                .padding(.bottom, 2)

            Picker("", selection: $numberOfDice) {
                ForEach(numberOfDiceOptions, id: \.self) { option in
                    Text(option)
                }
            }

            Button(action: {
                rollDice()
            }) {
                Text("Roll \(numberOfDice) \(selectedDiceType) dice")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(radius: 6)
            }
            .padding(.horizontal)


            if !result.isEmpty {
                Text("Result")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .shadow(radius: 8)
                    .padding(.bottom, 2)

                Text(result)
                    .font(.system(size: 100))
                    .bold()
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .shadow(radius: 8)
                    .padding(.bottom, 2)
            }
        }
        .padding()
    }

    func rollDice() {
        result = ""
        let type = Int(selectedDiceType.split(separator: "D").last!)!
        let number = Int(numberOfDice)!
        let diceFaces = ["⚀", "⚁", "⚂", "⚃", "⚄", "⚅"]


        for _ in 1...number {
            let roll = Int.random(in: 1...type)
            result.append(diceFaces[roll - 1] + " ")
            //result.append(String(roll) + " ")
        }
    }

}

#Preview {
    ContentView()
}
