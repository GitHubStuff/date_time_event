import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tracers/tracers.dart' as Log;

import '../modular/app_module.dart';
import '../flavor_config.dart';

const _databaseName = 'emulator.db';
const _exposeSql = true;
void main() {
  final values = FlavorValues(
    sqliteDatabaseName: _databaseName,
    sqliteDevelopment: _exposeSql,
  );
  Log.SetBaseLevel(Log.TRACE);
  FlavorConfig(flavor: Flavor.EMULATOR, values: values);
  runApp(
    ModularApp(module: AppModule()),
  );
}
