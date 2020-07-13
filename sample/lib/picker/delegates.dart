import 'package:date_time_event/date_time_event.dart';
import 'package:flutter/material.dart';

final _style = TextStyle(fontSize: 24);

//MARK:
class YearDelegate extends ListWheelChildDelegate {
  DateTimeEvent event;
  YearDelegate(this.event);
  Widget build(BuildContext context, int index) {
    if (index + 1700 < 1700 || index + 1700 > 2199) return null;
    return Text('${index + 1700}', style: _style);
  }

  bool shouldRebuild(oldDelegate) => true;

  int get estimatedChildCount => 1499;
}

//MARK:
class MonthDelegate extends ListWheelChildDelegate {
  final text = ['', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  DateTimeEvent event;
  MonthDelegate(this.event);
  Widget build(BuildContext context, int index) {
    if (index < 1) return null;
    final offset = (index % 12) + 1;
    return Text('${text[offset]}', style: _style);
  }

  bool shouldRebuild(oldDelegate) => true;

  int get estimatedChildCount => 500;
}

//MARK:
class DayDelegate extends ListWheelChildDelegate {
  DateTimeEvent event;
  DayDelegate(this.event);
  Widget build(BuildContext context, int index) {
    if (index < 1) return null;
    final bound = (index % event.days) + 1;
    return Text('$bound', style: _style);
  }

  bool shouldRebuild(oldDelegate) => true;

  int get estimatedChildCount => 200;
}

//MARK:
class HourDelegate extends ListWheelChildDelegate {
  DateTimeEvent event;
  HourDelegate(this.event);
  Widget build(BuildContext context, int index) {
    if (index < 0) return null;
    final bound = index % 24;
    final tempEvent = DateTimeEvent()..setNew(hour: bound);
    return Text(tempEvent.hours, style: _style);
  }

  bool shouldRebuild(oldDelegate) => true;

  int get estimatedChildCount => 1000;
}

//MARK:
class MinuteDelegate extends ListWheelChildDelegate {
  DateTimeEvent event;
  MinuteDelegate(this.event);
  Widget build(BuildContext context, int index) {
    if (index < 0) return null;
    final bound = index % 60;
    final tempEvent = DateTimeEvent()..setNew(minute: bound);
    return Text(tempEvent.minutes, style: _style);
  }

  bool shouldRebuild(oldDelegate) => true;

  int get estimatedChildCount => 1000;
}

//MARK:
class SecondDelegate extends ListWheelChildDelegate {
  DateTimeEvent event;
  SecondDelegate(this.event);
  Widget build(BuildContext context, int index) {
    if (index < 0) return null;
    final bound = index % 60;
    final tempEvent = DateTimeEvent()..setNew(second: bound);
    return Text(tempEvent.seconds, style: _style);
  }

  bool shouldRebuild(oldDelegate) => true;

  int get estimatedChildCount => 1000;
}

//MARK:
class MeridianDelegate extends ListWheelChildDelegate {
  DateTimeEvent event;
  MeridianDelegate(this.event);
  Widget build(BuildContext context, int index) {
    if (index < 0 || index > 1) return null;
    final tempEvent = DateTimeEvent()..setNew(hour: (index == 0) ? 0 : 13);
    return Text(tempEvent.meridian, style: _style);
  }

  bool shouldRebuild(oldDelegate) => true;

  int get estimatedChildCount => 2;
}
