import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/Provider/ChangeUI.dart';
import 'package:myapp/Provider/InitDeviceProvider.dart';
import 'package:myapp/UI/home.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.pink, // status bar color
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UIProvider>(
            create: (context) => UIProvider(),
          ),
          ChangeNotifierProvider<InitDeviceProvider>(
            create: (context) => InitDeviceProvider(),
          )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: HomePageStateless()));
  }
}
