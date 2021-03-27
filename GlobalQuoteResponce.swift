//
//  MainQuotes.swift
//  stockappyd (iOS)
//
//  Created by Artyom Ma  on 24.03.2021.
//

import Foundation

struct GlobalQuoteResponse: Codable {
    var quote: Quote
    private enum CodingKeys: String, CodingKey {
        case quote = "Global Quote"
    }
}

