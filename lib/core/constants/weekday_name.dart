class Weekday {
  static String getWeekday(int dayNumber) {
    if (dayNumber == 1) {
      return 'Monday';
    } else if (dayNumber == 2) {
      return 'Tuesday';
    } else if (dayNumber == 3) {
      return 'Wednesday';
    } else if (dayNumber == 4) {
      return 'Thursday';
    } else if (dayNumber == 5) {
      return 'Friday';
    } else if (dayNumber == 6) {
      return 'Saturday';
    }
    return 'Sunday';
  }
}
