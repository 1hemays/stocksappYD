//
//  StockManager.swift
//  stockappyd (iOS)
//
//  Created by Artyom Ma  on 25.03.2021.
//

import Foundation

final class StockQuoteManager: QuoteManagerProtocol, ObservableObject {
    @Published var quotes: [Quote] = []
    
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
        var internalQuotes = [Quote]()
        let downloadQueue = DispatchQueue(label: "com.devtechie.downloadQueue")
        let downloadGroup = DispatchGroup()
        
        stocks.forEach { (stock) in
            downloadGroup.enter()
            let url = URL(string: API.quoteUrl(for: stock))!
            NetworkManager<GlobalQuoteResponse>().fetch(from: url) { (result) in
                switch result {
                case .failure(let err):
                    print(err)
                    downloadQueue.async {
                        downloadGroup.leave()
                    }
                    
                case .success(let resp):
                    downloadQueue.async {
                        internalQuotes.append(resp.quote)
                        downloadGroup.leave()
                    }
                }
            }
        }
        
        downloadGroup.notify(queue: DispatchQueue.global()) {
            completion(.success(internalQuotes))
            DispatchQueue.main.async {
                self.quotes.append(contentsOf: internalQuotes)
            }
        }
    }
    
    
}
