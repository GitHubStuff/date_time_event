library date_time_event;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//enum Meridian { AM, PM }

const _dateFormat = 'EEE, MMM d, yyyy';
const _timeFormat = 'h:mm:ss a';
const _FEBRUARY = 2;

///
class DateTimeEvent {
  static bool _leapYear(int year) => (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));

  static int _numberOfDays({@required int year, @required int month}) {
    final List<int> lengths = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return (_leapYear(year) && month == _FEBRUARY) ? 29 : lengths[month];
  }

  DateTime _dateTime;

  DateTimeEvent([DateTime dateTime]) {
    final event = dateTime ?? DateTime.now();
    _dateTime = DateTime(event.year, event.month, event.day, event.hour, event.minute, event.second, 0, 0);
  }

  int get days => _numberOfDays(year: event.year, month: event.month);
  DateTime get event => _dateTime;
  String get formatted => '$formattedDate $formattedTime';
  String get formattedTime => DateFormat('$_timeFormat').format(_dateTime);
  String get formattedDate => DateFormat('$_dateFormat').format(_dateTime);
  bool get isLeapYear => _leapYear(event.year);
  String get meridian => DateFormat('a').format(event);
  String get hours => DateFormat('h').format(event);
  String get minutes => DateFormat('mm').format(event);
  String get seconds => DateFormat('ss').format(event);

  void setNew({int year, int month, int day, int hour, int minute, int second}) {
    DateTime newTime = DateTime(
      year ?? event.year,
      month ?? event.month,
      day ?? event.day,
      hour ?? event.hour,
      minute ?? event.minute,
      second ?? event.second,
    );

    if (newTime.month != (month ?? event.month)) {
      final lastDay = _numberOfDays(year: newTime.year, month: (month ?? event.month));
      newTime = DateTime(
        year ?? event.year,
        month ?? event.month,
        lastDay,
        hour ?? event.hour,
        minute ?? event.minute,
        second ?? event.second,
      );
    }
    _dateTime = newTime;
  }
}
