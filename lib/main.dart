import 'package:contact_dairy_app/app.dart';
import 'package:contact_dairy_app/controller/audio_player_controller.dart';
import 'package:contact_dairy_app/presentations/practice/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'controller/contact_controller.dart';
import 'controller/counter_controller.dart';
import 'controller/step_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StepperProvider()),
        ChangeNotifierProvider(create: (context) => CounterController()),
        ChangeNotifierProvider(create: (context) => AudioPlayerController()),
        ChangeNotifierProvider(create: (context) => ContactController()),
        ChangeNotifierProvider(create: (context) => ProviderPlatform()),
      ],
      child: const MyApp(),
    ),
  );
}
