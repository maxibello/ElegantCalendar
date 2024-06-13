// Kevin Li - 5:19 PM - 6/14/20

import SwiftUI

public protocol ElegantCalendarDelegate: MonthlyCalendarDelegate, YearlyCalendarDelegate { }

public protocol MonthlyCalendarDelegate {

    func calendar(didSelectFilledDay date: Date)
    func calendar(didSelectEmptyDay date: Date)
    func calendar(willDisplayMonth date: Date)

}

public extension MonthlyCalendarDelegate {

    func calendar(didSelectDay date: Date) { }
    func calendar(willDisplayMonth date: Date) { }

}

public protocol YearlyCalendarDelegate {

    func calendar(didSelectMonthTitle date: Date)
    func calendar(didSelectMonth date: Date)
    func calendar(willDisplayYear date: Date)

}

public extension YearlyCalendarDelegate {

    func calendar(didSelectMonth date: Date) { }
    func calendar(didSelectMonthTitle date: Date) { }
    func calendar(willDisplayYear date: Date) { }

}
