//
//  ContentView.swift
//  AiChat
//
//  Created by 김동현 on 10/16/24.
//

import SwiftUI

struct ChatScreen: View {
    @StateObject private var viewModel = ChatViewModel()
    @State private var inputText = ""
    
    let symptoms = ["머리가 아파요", "허리가 아파요", "배가 아파요", "감기 증상이 있어요"]
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 30)
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.messages) { message in
                        MessageBubble(message: message)
                    }
                }
            }
            
            HStack {
                ForEach(symptoms, id: \.self) { symptom in
                    QuickSymptomButton(symptom: symptom) {
                        viewModel.sendMessage(symptom)
                    }
                }
            }
            .padding(.horizontal)
            
            ChatInput(text: $inputText, onSend: {
                viewModel.sendMessage(inputText)
                inputText = ""
            })
        }
        .onAppear {
            viewModel.loadInitialMessage()
        }
    }
}

#Preview {
    ChatScreen()
}
