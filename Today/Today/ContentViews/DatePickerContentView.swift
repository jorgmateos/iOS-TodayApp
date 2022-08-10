//
//  DatePickerContentView.swift
//  Today
//
//  Created by Jorge García Mateos on 9/8/22.
//

import UIKit

class DatePickerContentView: UIView, UIContentView {
    struct Configuration: UIContentConfiguration {
        var date = Date.now
        var onChange: (Date) -> Void = { _ in }

        func makeContentView() -> UIView & UIContentView {
            return DatePickerContentView(self)
        }
    }

    let datePickerView = UIDatePicker()
    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration: configuration)
        }
    }

    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubview(datePickerView)
        datePickerView.addTarget(self, action: #selector(didChange(_:)), for: .valueChanged)
        datePickerView.preferredDatePickerStyle = .inline
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        datePickerView.date = configuration.date
    }

    @objc private func didChange(_ sender: UIDatePicker) {
        guard let configuration = configuration as? DatePickerContentView.Configuration else { return }
        configuration.onChange(datePickerView.date)
    }
}

extension UICollectionViewListCell {
    func datePickerViewConfiguration() -> DatePickerContentView.Configuration {
        DatePickerContentView.Configuration()
    }
}
