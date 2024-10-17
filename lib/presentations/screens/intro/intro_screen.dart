import 'package:contact_dairy_app/helper/shr_helper.dart';
import 'package:contact_dairy_app/start/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    ShrHelper srfHelper = ShrHelper();
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Contact Dairy",
            body: "To store your contacts",
            image: Image.network(
              'https://img.freepik.com/free-vector/hand-holding-phone-isolated-flat-vector-illustration_74855-6823.jpg',
            ),
          ),
          PageViewModel(
            title: "Contact Dairy",
            body: "To store your contacts",
            image: Image.network(
                'https://www.shutterstock.com/image-vector/get-touch-abstract-concept-vector-600nw-2253719001.jpg'),
          ),
          PageViewModel(
            title: "Contact Dairy",
            body: "To store your contacts",
            image: Image.network(
                'https://img.freepik.com/free-vector/hand-drawn-flat-design-omnichannel-illustration_23-2149360245.jpg'),
          ),
        ],
        showSkipButton: true,
        showNextButton: true,
        showDoneButton: true,
        next: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        onSkip: () async {
          await srfHelper.saveData();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        },
        skip: const Text("Skip"),
        done: const Text("Done"),
        onDone: () async {
          await srfHelper.saveData();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        },
      ),
    );
  }
}
