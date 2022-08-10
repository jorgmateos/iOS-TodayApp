//
//  TodayError.swift
//  Today
//
//  Created by Jorge García Mateos on 10/8/22.
//

import Foundation

enum TodayError: LocalizedError {
    case accessDenied
    case accessRestricted
    case failedReadingCalendarItem
    case failedReadingReminders
    case reminderHasNoDueDate
    case unknown

    var errorDescription: String? {
        switch self {
        case .accessDenied:
            return NSLocalizedString("The app doesn't have permission to read reminders", comment: "Access denied error description ")
        case .accessRestricted:
            return NSLocalizedString("This device doesn't allow access to reminders", comment: "Access restricted error description")
        case .failedReadingCalendarItem:
            return NSLocalizedString("Failed to read calendar item", comment: "Failed reading calendar item error description")
        case .failedReadingReminders:
            return NSLocalizedString("Failed to read reminders", comment: "Failed reading reminders error description")
        case .reminderHasNoDueDate:
            return NSLocalizedString("A reminder has no due date", comment: "Reminder has no due date error description")
        case .unknown:
            return NSLocalizedString("An unknown error ocurred", comment: "Unknown error description")
        }
    }
}
