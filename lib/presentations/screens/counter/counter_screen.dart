import 'package:contact_dairy_app/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CounterController counterController =
        Provider.of<CounterController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CounterPage',
          style: TextStyle(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: size.width * 0.3,
            width: size.width * 0.3,
            decoration: BoxDecoration(
              color: Colors.cyanAccent.shade100,
              shape: BoxShape.circle,
            ),
            child: Text(
              '${counterController.counter}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: size.height * 0.2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton.extended(
                onPressed: counterController.increment,
                icon: const Icon(Icons.add),
                label: Text('add'),
              ),
              FloatingActionButton.extended(
                  onPressed: counterController.decrement,
                  icon: const Icon(Icons.remove),
                  label: Text('Minus')),
              FloatingActionButton.extended(
                  onPressed: counterController.multy2x, label: Text('2X ')),
              FloatingActionButton.extended(
                  onPressed: counterController.multy3x, label: Text('3X')),
              FloatingActionButton.extended(
                  onPressed: counterController.multy4x, label: Text('4X')),
            ],
          ),
          SizedBox(
            height: size.height * 0.2,
          ),
          FloatingActionButton(
            onPressed: () {
              counterController.reset();
            },
            child: Icon(Icons.refresh),
          )
        ],
      ),
    );
  }
}
