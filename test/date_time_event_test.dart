import 'package:flutter_test/flutter_test.dart';

import 'package:date_time_event/date_time_event.dart';

void main() {
  test('Next month smaller [adjust]', () {
    final DateTime start = DateTime(2020, 1, 31, 0, 0, 0, 0, 0); // 31-JAN-2020
    final dateTimeEvent = DateTimeEvent(start);
    final text = dateTimeEvent.formatted;
    print('$text');
    dateTimeEvent.setNew(month: 2);
    final newText = dateTimeEvent.formatted;
    print('$newText');
    expect(dateTimeEvent.event.day, 29);
    expect(dateTimeEvent.event.month, 2);
    expect(newText, isNotNull);
  });

  test('Next month larger [adjust]', () {
    final DateTime start = DateTime(2020, 2, 28, 0, 0, 0, 0, 0); // 28-FEB-2020
    final dateTimeEvent = DateTimeEvent(start);
    final text = dateTimeEvent.formatted;
    print('before $text');
    dateTimeEvent.setNew(month: 1); //Change month to january
    final newText = dateTimeEvent.formatted;
    print('after $newText');
    expect(dateTimeEvent.event.day, 28);
    expect(dateTimeEvent.event.month, 1);
    expect(newText, isNotNull);
  });

  test('Change year in while in leap day [adjust]', () {
    final DateTime start = DateTime(2020, 2, 29, 0, 0, 0, 0, 0); // 29-FEB-2020 -- leap year
    final dateTimeEvent = DateTimeEvent(start);
    final text = dateTimeEvent.formatted;
    print('leap $text');
    dateTimeEvent.setNew(year: 2021); //Change to non-leap-year
    final newText = dateTimeEvent.formatted;
    print('non-leap $newText'); //Should be 28-Feb-2021
    expect(dateTimeEvent.event.day, 28);
    expect(dateTimeEvent.event.month, 2);
    expect(newText, isNotNull);
  });

  test('March to April [adjust]', () {
    final DateTime start = DateTime(2020, 3, 31, 0, 0, 0, 0, 0); // 31-March
    final dateTimeEvent = DateTimeEvent(start);
    final text = dateTimeEvent.formatted;
    print('march $text');
    dateTimeEvent.setNew(month: 4); //April
    final newText = dateTimeEvent.formatted;
    print('april $newText');
    expect(dateTimeEvent.event.day, 30);
    expect(dateTimeEvent.event.month, 4);
    expect(newText, isNotNull);
  });
}
