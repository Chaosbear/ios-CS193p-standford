//
//  ContentView.swift
//  Memorize
//
//  Created by Sukrit Chatmeeboon on 29/1/2565 BE.
//

import SwiftUI

struct ContentView: View {

    
    var defaultEmojis = ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇"]
    
    var animalEmojis = ["🐶","🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", ]
    
    var vehicleEmojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜"]
    
    var fruitEmojis = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍"]
    
    @State var emojis: [String]
    @State var emojiCount: Int
    
    init() {
        self.emojis = defaultEmojis.shuffled()
        self.emojiCount = 8
    }
    
    var body: some View {
        VStack {
            Text("Memorize!!!")
                .font(.largeTitle)
                .foregroundColor(.blue)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                .padding(.trailing)
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        defaultTheme
                        animalTheme
                        vehicleTheme
                        fruitTheme
                    }
                }
                add
                .padding(.leading)
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
    
    var defaultTheme: some View {
        VStack {
            Button(action: {
                selectTheme(defaultEmojis)
            }, label: {
                Image(systemName: "face.smiling")
            })
            Text("Face").font(.body)
        }
    }
    
    var animalTheme: some View {
        VStack {
            Button(action: {
                selectTheme(animalEmojis)
            }, label: {
                Image(systemName: "pawprint")
            })
            Text("Animal").font(.body)
        }
    }
    
    var vehicleTheme: some View {
        VStack {
            Button(action: {
                selectTheme(vehicleEmojis)
            }, label: {
                Image(systemName: "car")
            })
            Text("Vehicle").font(.body)
        }
    }
    
    var fruitTheme: some View {
        VStack {
            Button(action: {
                selectTheme(fruitEmojis)
            }, label: {
                Image(systemName: "applelogo")
            })
            Text("Fruit").font(.body)
        }
    }
    
    private func selectTheme(_ theme: [String]) {
        emojis = theme.shuffled()
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
