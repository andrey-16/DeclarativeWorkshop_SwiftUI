//
//  Formatters.swift
//  DeclarativeWorkshop
//
//  Created by Vadim Belyaev on 3/14/21.
//

import Foundation

enum Formatters {
    static let currencyFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.locale = Locale(identifier: "en_US")
        nf.numberStyle = .currency
        return nf
    }()
}
