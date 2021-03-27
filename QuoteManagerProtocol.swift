//
//  QuoteManagerProtocol.swift
//  stockappyd (iOS)
//
//  Created by Artyom Ma  on 25.03.2021.
//

import Foundation

protocol QuoteManagerProtocol {
    var quotes: [Quote] { get set }
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void)
}
