//
//  SuggestionRow.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 25.03.2023.
//

import SwiftUI

struct SuggestionRow: View {
    @State private var suggestion: String
    
    init(suggestion: String) {
        self.suggestion = suggestion
    }
    
    var body: some View {
        Text(suggestion)
            .font(.custom("Montserrat_Medium", size: 11))
            .frame(width: 262, height: 24)
            .background(.thinMaterial)
            .cornerRadius(13)
    }
}

struct SuggestionRow_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionRow(suggestion: "Test")
    }
}
