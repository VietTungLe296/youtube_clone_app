//
//  CustomDateFormatter.swift
//  YoutubeClone
//
//  Created by Le Viet Tung on 05/07/2023.
//

import Foundation

struct CustomDateFormatter {
    static func getFormatted(_ date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        return df.string(from: date)
    }
}
