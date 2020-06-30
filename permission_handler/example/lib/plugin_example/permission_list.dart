import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

import 'package:permission_handler_example/plugin_example/permission_widget.dart';

/// ListView containing permissions
class PermissionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
          children: Permission.values
              .where((Permission permission) {
                if (Platform.isIOS) {
                  return permission != Permission.unknown &&
                      permission != Permission.sms &&
                      //permission != Permission.storage &&
                      permission != Permission.ignoreBatteryOptimizations &&
                      permission != Permission.accessMediaLocation;
                } else {
                  return permission != Permission.unknown &&
                      permission != Permission.mediaLibrary &&
                      permission != Permission.photos &&
                      permission != Permission.reminders;
                }
              })
              .map((permission) => PermissionWidget(permission))
              .toList()),
    );
  }
}
