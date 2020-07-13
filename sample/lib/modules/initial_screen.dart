import 'package:date_time_event/date_time_event.dart';

import '../resources/widgets/theme_icon_widget.dart';
import 'package:tracers/tracers.dart' as Log;

import '../modules/initial_module.dart';
import '../resources/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mode_theme/mode_theme.dart';

final _style = TextStyle(fontSize: 24);

class DayDelegate extends ListWheelChildDelegate {
  DateTimeEvent event;
  DayDelegate(this.event);
  Widget build(BuildContext context, int index) {
    if (index < 1 || index > event.days) return null;
    return Text('$index', style: _style);
  }

  bool shouldRebuild(oldDelegate) => true;

  int get estimatedChildCount => event.days;
}

class MonthDelegate extends ListWheelChildDelegate {
  final text = ['', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  DateTimeEvent event;
  MonthDelegate(this.event);
  Widget build(BuildContext context, int index) {
    if (index < 1 || index > 12) return null;
    return Text('${text[index]}', style: _style);
  }

  bool shouldRebuild(oldDelegate) => true;

  int get estimatedChildCount => 12;
}

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
  ListWheelChildDelegate dayDelegate;
  ListWheelChildDelegate monthDelegate;
  ListWheelChildDelegate yearDelegate;

  final DateTimeEvent dateTimeEvent = DateTimeEvent();

  @override
  void initState() {
    super.initState();
    dayDelegate = DayDelegate(dateTimeEvent);
    monthDelegate = MonthDelegate(dateTimeEvent);
    yearDelegate = YearDelegate(dateTimeEvent);
  }

  @override
  Widget build(BuildContext context) {
    final height = 170.0;
    return Center(
      child: Container(
        color: Colors.red,
        width: 190.0,
        child: Row(children: [
          Container(height: height, width: 50, child: _dayWidget()),
          Container(height: height, width: 70, child: _monthWidget()),
          Container(height: height, width: 70, child: _yearWidget()),
        ]),
      ),
    );
  }

  Widget _dayWidget() {
    return ListWheelScrollView.useDelegate(
      childDelegate: dayDelegate,
      controller: FixedExtentScrollController(),
      itemExtent: 44.0,
      physics: FixedExtentScrollPhysics(),
    );
  }

  Widget _monthWidget() {
    return ListWheelScrollView.useDelegate(
      childDelegate: monthDelegate,
      controller: FixedExtentScrollController(),
      itemExtent: 44.0,
      physics: FixedExtentScrollPhysics(),
    );
  }

  Widget _yearWidget() {
    return ListWheelScrollView.useDelegate(
      childDelegate: yearDelegate,
      controller: FixedExtentScrollController(),
      itemExtent: 44.0,
      physics: FixedExtentScrollPhysics(),
    );
  }
}
