//
//  ChatViewModel.swift
//  AiChat
//
//  Created by 김동현 on 10/16/24.
//

import Foundation

@MainActor
class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    private let aiService = AIService()
    
    func sendMessage(_ text: String) {
        let userMessage = Message(text: text, isUser: true)
        messages.append(userMessage)
        
        Task {
            do {
                let aiResponse = try await aiService.sendMessage(text)
                let aiMessage = Message(text: aiResponse, isUser: false)
                messages.append(aiMessage)
            } catch {
                print("Error getting AI response: \(error)")
                let errorMessage = Message(text: "AI 응답 오류: \(error.localizedDescription)", isUser: false)
                messages.append(errorMessage)
            }
        }
    }
    
    func loadInitialMessage() {
        let initialMessage = Message(text: "안녕하세요! 어떤 도움이 필요하신가요?", isUser: false)
        messages.append(initialMessage)
    }
}

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

