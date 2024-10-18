import 'package:contact_dairy_app/app.dart';
import 'package:contact_dairy_app/controller/addcontact_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'controller/counter_controller.dart';
import 'controller/step_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StepperProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CounterController(),
        ),
        ChangeNotifierProvider(create: (context) => AddContactController()),
      ],
      child: const MyApp(),
    ),
  );
}
