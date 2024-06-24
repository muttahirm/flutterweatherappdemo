class Month {
  static String getMonthName(int dayNumber) {
    if (dayNumber == 1) {
      return 'Jan';
    } else if (dayNumber == 2) {
      return 'Feb';
    } else if (dayNumber == 3) {
      return 'Mar';
    } else if (dayNumber == 4) {
      return 'Apr';
    } else if (dayNumber == 5) {
      return 'May';
    } else if (dayNumber == 6) {
      return 'Jun';
    } else if (dayNumber == 7) {
      return 'Jul';
    } else if (dayNumber == 8) {
      return 'Aug';
    } else if (dayNumber == 9) {
      return 'Sep';
    } else if (dayNumber == 10) {
      return 'Oct';
    } else if (dayNumber == 11) {
      return 'Nov';
    }
    return 'Dec';
  }
}
