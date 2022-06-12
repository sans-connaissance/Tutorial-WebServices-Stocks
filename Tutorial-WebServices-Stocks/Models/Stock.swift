//
//  Stock.swift
//  Tutorial-WebServices-Stocks
//
//  Created by David Malicke on 6/12/22.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String

}
