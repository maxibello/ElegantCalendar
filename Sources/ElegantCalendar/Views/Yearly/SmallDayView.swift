// Kevin Li - 7:19 PM - 6/13/20

import SwiftUI

struct SmallDayView: View, YearlyCalendarManagerDirectAccess {

    let calendarManager: YearlyCalendarManager

    let week: Date
    let day: Date

    private var isDayWithinDateRange: Bool {
        day >= calendar.startOfDay(for: startDate) && day <= endDate
    }

    private var isDayWithinWeekMonthAndYear: Bool {
        calendar.isDate(week, equalTo: day, toGranularities: [.month, .year])
    }

    private var isDayToday: Bool {
        calendar.isDateInToday(day)
    }

    var body: some View {
        Circle()
            .fill(isFilledDay() ? Color.primary : .secondary)
            .foregroundColor(isDayToday ? .systemBackground : .primary)
            .frame(width: 3, height: 3)
            .opacity(isDayWithinDateRange && isDayWithinWeekMonthAndYear ? 1 : 0)
    }

    private var numericDay: String {
        String(calendar.component(.day, from: day))
    }
    
    private func isFilledDay() -> Bool {
        guard let filledDays = calendarManager.datasource?.filledDays else { return false }
        
        for filledDay in filledDays {
            if day >= calendar.startOfDay(for: filledDay) &&
                day <= calendar.endOfDay(for: filledDay) {
                return true
            }
        }
        
        return false
    }
    
    private var isTodayWithinDateRange: Bool {
        Date() >= calendar.startOfDay(for: startDate) &&
            calendar.startOfDay(for: Date()) <= endDate
    }

}

struct SmallDayView_Previews: PreviewProvider {
    static var previews: some View {
        LightDarkThemePreview {
            SmallDayView(calendarManager: .mock, week: Date(), day: Date())

            SmallDayView(calendarManager: .mock, week: Date(), day: .daysFromToday(3))
        }
    }
}
