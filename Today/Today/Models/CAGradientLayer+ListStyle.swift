//
//  CAGradientLayer+ListStyle.swift
//  Today
//
//  Created by Jorge García Mateos on 10/8/22.
//

import UIKit

extension CAGradientLayer {
    static func gradientLayer(for style: ReminderListStyle, in frame: CGRect) -> Self {
        let layer = Self()
        layer.colors = colors(for: style)
        layer.frame = frame
        return layer
    }

    private static func colors(for style: ReminderListStyle) -> [CGColor] {
        let beginColor: UIColor
        let endColor: UIColor

        switch style {
        case .today:
            beginColor = .init(named: "TodayGradientTodayBegin")!
            endColor = .init(named: "TodayGradientTodayEnd")!
        case .future:
            beginColor = .init(named: "TodayGradientFutureBegin")!
            endColor = .init(named: "TodayGradientFutureBegin")!
        case .all:
            beginColor = .init(named: "TodayGradientAllBegin")!
            endColor = .init(named: "TodayGradientAllBegin")!
        }

        return [beginColor.cgColor, endColor.cgColor]
    }
}
