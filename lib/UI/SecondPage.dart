import 'package:flutter/material.dart';
import 'package:myapp/Provider/InitDeviceProvider.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<InitDeviceProvider>(
        builder: (context, initDeviceModel, child) {
      return Scaffold(
        body: Center(
          child: Text(initDeviceModel.initResponse.toJson().toString()),
        ),
      );
    });
  }
}
