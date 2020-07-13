import 'package:date_time_event/date_time_event.dart';
import 'package:sample/picker/delegates.dart';

import '../resources/widgets/theme_icon_widget.dart';
import 'package:tracers/tracers.dart' as Log;

import '../modules/initial_module.dart';
import '../resources/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mode_theme/mode_theme.dart';

final _opacity = 0.5;
final _perspecive = 0.01;
final _magnify = 1.0;
final _extent = 44.0;
final _pickerHeight = 170.0;
final _pickerWidth = 200.0;

class InitialScreen extends ModularStatelessWidget<InitialModule> {
  @override
  Widget build(BuildContext context) {
    return _scaffold(context);
  }

  Widget _scaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: ThemeIconWidget(),
            onPressed: () {
              ModeTheme.of(context).toggleBrightness();
            },
          )
        ],
        title: Text(tr(context, 'Title')),
      ),
      body: _InitialWidget(), // body(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        tooltip: 'NoOp',
        child: Icon(Icons.add),
      ),
    );
  }
}

//MARK:
class _InitialWidget extends StatefulWidget {
  @override
  __InitialWidget createState() => __InitialWidget();
}

//MARK:
class __InitialWidget extends State<_InitialWidget> {
  ListWheelChildDelegate _dayDelegate;
  ListWheelChildDelegate _monthDelegate;
  ListWheelChildDelegate _yearDelegate;
  ListWheelChildDelegate _hourDelegate;
  ListWheelChildDelegate _minuteDelegate;
  ListWheelChildDelegate _secondDelegate;
  ListWheelChildDelegate _meridianDelegate;

  final DateTimeEvent dateTimeEvent = DateTimeEvent();

  @override
  void initState() {
    super.initState();
    _dayDelegate = DayDelegate(dateTimeEvent);
    _monthDelegate = MonthDelegate(dateTimeEvent);
    _yearDelegate = YearDelegate(dateTimeEvent);
    _hourDelegate = HourDelegate(dateTimeEvent);
    _minuteDelegate = MinuteDelegate(dateTimeEvent);
    _secondDelegate = SecondDelegate(dateTimeEvent);
    _meridianDelegate = MeridianDelegate(dateTimeEvent);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _datePicker(),
          _timePicker(),
        ],
      ),
    );
  }

  Widget _datePicker() {
    return Container(
      color: Colors.red,
      width: _pickerWidth,
      child: Row(children: [
        Container(height: _pickerHeight, width: _pickerWidth * 0.2631, child: _dayWidget()),
        Container(height: _pickerHeight, width: _pickerWidth * 0.3684, child: _monthWidget()),
        Container(height: _pickerHeight, width: _pickerWidth * 0.3684, child: _yearWidget()),
      ]),
    );
  }

  Widget _timePicker() {
    return Container(
      color: Colors.green,
      width: _pickerWidth,
      child: Row(children: [
        Container(height: _pickerHeight, width: _pickerWidth / 4.0, child: _hourWidget()),
        Container(height: _pickerHeight, width: _pickerWidth / 4.0, child: _minuteWidget()),
        Container(height: _pickerHeight, width: _pickerWidth / 4.0, child: _secondWidget()),
        Container(height: _pickerHeight, width: _pickerWidth / 4.0, child: _meridianWidget()),
      ]),
    );
  }

  Widget _dayWidget() {
    return ListWheelScrollView.useDelegate(
      childDelegate: _dayDelegate,
      controller: FixedExtentScrollController(),
      itemExtent: _extent,
      physics: FixedExtentScrollPhysics(),
      overAndUnderCenterOpacity: _opacity,
      perspective: _perspecive,
      offAxisFraction: -1.0,
      magnification: _magnify,
    );
  }

  Widget _monthWidget() {
    return ListWheelScrollView.useDelegate(
      childDelegate: _monthDelegate,
      controller: FixedExtentScrollController(),
      itemExtent: _extent,
      physics: FixedExtentScrollPhysics(),
      overAndUnderCenterOpacity: _opacity,
      perspective: _perspecive,
      offAxisFraction: 0.0,
      magnification: _magnify,
    );
  }

  Widget _yearWidget() {
    return ListWheelScrollView.useDelegate(
      childDelegate: _yearDelegate,
      controller: FixedExtentScrollController(),
      itemExtent: _extent,
      physics: FixedExtentScrollPhysics(),
      overAndUnderCenterOpacity: _opacity,
      perspective: _perspecive,
      offAxisFraction: 0.3,
      magnification: _magnify,
    );
  }

  Widget _hourWidget() {
    return ListWheelScrollView.useDelegate(
      childDelegate: _hourDelegate,
      controller: FixedExtentScrollController(),
      itemExtent: _extent,
      physics: FixedExtentScrollPhysics(),
      overAndUnderCenterOpacity: _opacity,
      perspective: _perspecive,
      offAxisFraction: -1.0,
      magnification: _magnify,
    );
  }

  Widget _minuteWidget() {
    return ListWheelScrollView.useDelegate(
      childDelegate: _minuteDelegate,
      controller: FixedExtentScrollController(),
      itemExtent: _extent,
      physics: FixedExtentScrollPhysics(),
      overAndUnderCenterOpacity: _opacity,
      perspective: _perspecive,
      offAxisFraction: -0.1,
      magnification: _magnify,
    );
  }

  Widget _secondWidget() {
    return ListWheelScrollView.useDelegate(
      childDelegate: _secondDelegate,
      controller: FixedExtentScrollController(),
      itemExtent: _extent,
      physics: FixedExtentScrollPhysics(),
      overAndUnderCenterOpacity: _opacity,
      perspective: _perspecive,
      offAxisFraction: 0.1,
      magnification: _magnify,
    );
  }

  Widget _meridianWidget() {
    return ListWheelScrollView.useDelegate(
      childDelegate: _meridianDelegate,
      controller: FixedExtentScrollController(),
      itemExtent: _extent,
      physics: FixedExtentScrollPhysics(),
      overAndUnderCenterOpacity: _opacity,
      perspective: _perspecive,
      offAxisFraction: 1.0,
      magnification: _magnify,
    );
  }
}
