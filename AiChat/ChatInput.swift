//
//  ChatInput.swift
//  AiChat
//
//  Created by 김동현 on 10/16/24.
//

import SwiftUI

struct ChatInput: View {
    @Binding var text: String
    let onSend: () -> Void
    
    var body: some View {
        HStack {
            TextField("메시지를 입력하세요", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: onSend) {
                Image(systemName: "paperplane.fill")
            }
        }
        .padding()
    }
}
