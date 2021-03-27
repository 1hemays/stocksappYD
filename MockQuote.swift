//
//  MockQuote.swift
//  stockappyd (iOS)
//
//  Created by Artyom Ma  on 25.03.2021.
//

import Foundation

final class MockQuoteManager: QuoteManagerProtocol, ObservableObject {
  
    @Published var quotes: [Quote] = []
    
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
        let aapl = Quote(symbol: "122.2", open: "132.34", high: "135.12", low: "120.14", price: "132.9", change: "-0.30", changePercent: "-0.24%")
        let amzn = Quote(symbol: "130.3", open: "138.66", high: "139.12", low: "130.14", price: "135.9", change: "-0.20", changePercent: "-0.44%")
        let goog = Quote(symbol: "128.8", open: "124.23", high: "130.12", low: "123.14", price: "123.9", change: "-0.12", changePercent: "-0.14%")
        let nasa = Quote(symbol: "139.4", open: "135.34", high: "138.2", low: "131.34", price: "133.9", change: "-0.13", changePercent: "-0.34%")
        let yandex = Quote(symbol: "140.2", open: "139.56", high: "141.22", low: "133.27", price: "136.8", change: "-0.34", changePercent: "-0.6%")
        
        for _ in 0..<8 {
            quotes .append(contentsOf: [aapl, amzn, goog, nasa, yandex])
        }
    }
 }
