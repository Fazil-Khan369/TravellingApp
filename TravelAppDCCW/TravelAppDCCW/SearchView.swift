//
//  SearchView.swift
//  TravelAppDCCW
//
//  Created by Fazil P on 15/11/20.
//

import SwiftUI

struct SearchView: View {
    @Binding var text: String
    @State private var isEditing = false
    var body: some View {
        HStack {
            TextField("Where you want to go?", text: $text)
                .padding(15)
                .padding(.horizontal, 25)
                .background(Color.gray.opacity(0.08))
                .cornerRadius(8)
                .overlay(
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                    if isEditing {
                        Button(action: {
                            self.text = ""
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                            
                        }
                    }
                }
            ).onTapGesture {
                self.isEditing = true
            }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: .constant(""))
    }
}
