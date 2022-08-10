//
//  ProgressHeaderView.swift
//  Today
//
//  Created by Jorge García Mateos on 10/8/22.
//

import UIKit

class ProgressHeaderView: UICollectionReusableView {
    // Type of suplementary view that the collection view can present
    static var elementKind: String { UICollectionView.elementKindSectionHeader }

    // Progress value
    var progress: CGFloat = 0 {
        didSet {
            setNeedsLayout() // invalidates the current layout and triggers an update
            heightConstraint?.constant = progress * bounds.height
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.layoutIfNeeded()
            }
        }
    }

    // Views
    private let upperView = UIView(frame: .zero)
    private let lowerView = UIView(frame: .zero)
    private let containerView = UIView(frame: .zero)

    // Height
    private var heightConstraint: NSLayoutConstraint?

    // Accessibility
    private var valueFormat: String {
        NSLocalizedString("%d percent", comment: "Progress percentage vañue format")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        prepareSubviews()
        isAccessibilityElement = true
        accessibilityLabel = NSLocalizedString("Progress", comment: "Progress view accesibility label")
        accessibilityTraits.update(with: .updatesFrequently)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Accesibility
        accessibilityValue = String(format: valueFormat, Int(progress * 100.0))

        // Update height constraint
        heightConstraint?.constant = progress * bounds.height

        // Enable masksToBounds in the container view's layer and adjust the corner radius
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 0.5 * containerView.bounds.width
    }

    func prepareSubviews() {
        containerView.addSubview(upperView)
        containerView.addSubview(lowerView)
        addSubview(containerView)

        upperView.translatesAutoresizingMaskIntoConstraints = false
        lowerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false

        // Mantain a 1:1 fixed aspect ratio for the superview and container views
        heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1).isActive = true

        // Center the container view horizontally and vertically in the layout frame
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        // Scale the container view to 85 percent of the size of the superview
        containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true

        // Vertically constrain the subviews by setting the following:
        /**     - `upperView` top anchor to the superview top anchor  */
        upperView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        /**     - `upperView` bottom anchor to the `lowerView` top anchor */
        upperView.bottomAnchor.constraint(equalTo: lowerView.topAnchor).isActive = true
        /**     - `lowerView` bottom anchor to the superview bottom anchor */
        lowerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        // Horizontally constraint the subviews by setting the upperView and lowerView leading and trailing anchors equal to thos of the superview
        upperView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        upperView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lowerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lowerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        // Create an adjustable height constraint for the lower view and assign the height anchor a starting size of 0
        heightConstraint = lowerView.heightAnchor.constraint(equalToConstant: 0)
        heightConstraint?.isActive = true

        // Assign background colors to the views
        backgroundColor = .clear
        containerView.backgroundColor = .clear
        upperView.backgroundColor = .init(named: "TodayProgressUpperBackground")
        lowerView.backgroundColor = .init(named: "TodayProgressLowerBackground")
    }
}
