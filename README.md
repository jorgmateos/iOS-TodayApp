# iOS-TodayApp
Today, a productivity app for iOS that presents daily reminders

The goal of Today is not only to help users focus on their tasks for the day, but also to use visual design and animation to present a muted, calm interface.

Take a closer look at the Today app.

## Reminder List
The main screen of the app displays a list of a user’s reminders. The segmented control in the navigation bar lets users filter reminders by due date categories: Today, Future, or All. The user can complete reminders by tapping a done button. The progress circle — the large circle above the reminder list — fills in as the user completes reminders. Tapping the Add button (+) in the navigation bar creates a new reminder.

## Reminder View and Editing Modes
The detail screen shows more information about a reminder, including its title, due date, time due, and additional notes. In view mode, as shown here, the reminder details appear in rows with icons. The user can alter the reminder’s details by tapping the Edit button.

In editing mode, a visually distinct view displays editable fields and pickers to let the user change details. You’ll reuse this edit view to display the Add Reminder screen.

## Add Reminder Screen
The Add Reminder screen appears when the user taps the Add button (+) in the reminder list. This screen shares cells with the edit view, but presents modally instead of pushing onto the navigation stack.
