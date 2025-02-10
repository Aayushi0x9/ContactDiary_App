import 'package:contact_dairy_app/exe.dart';
import 'package:contact_dairy_app/presentations/practice/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePAge extends StatefulWidget {
  const HomePAge({super.key});

  @override
  State<HomePAge> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ProviderPlatform provider = Provider.of<ProviderPlatform>(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Android'),
        actions: [
          CupertinoSwitch(
              value: provider.isAndroid,
              onChanged: (value) {
                provider.changePlatform();
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  DateTime? date = await showDatePicker(
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2025),
                    initialDate: provider.date,
                    currentDate: provider.date,
                    context: context,
                  );
                  provider.changeDate(d1: date);
                  provider.date =
                      "${date!.day}/${date.month}/${date.year}" as DateTime;
                },
                child: Text(
                    "${provider.date.day}/${provider.date.month}/${provider.date.year}")),
            20.h,
            ElevatedButton(
                onPressed: () async {
                  TimeOfDay? date = await showTimePicker(
                      initialTime: provider.time, context: context);
                  provider.changeTime(t1: date);
                },
                child: Text(
                    "${provider.time.hour}:${provider.time.minute} ${provider.time.period.name.toUpperCase()}")),
            20.h,
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Alert DailogBox"),
                      content: const Text('Are you sure to Exit ??'),
                      actions: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Yes')),
                      ],
                    ),
                  );
                },
                child: const Text('showDialog')),
            20.h,
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  showDragHandle: true,
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  barrierLabel: 'ModalBottomSheet',
                  backgroundColor: Colors.green,
                  builder: (context) {
                    return Container(
                      alignment: Alignment.topCenter,
                      height: 200,
                      width: double.infinity,
                      color: Colors.green,
                      child: const Text(
                        'ModalBottomSheet',
                        style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('ModalBottomSheet'),
            ),
            20.h,
            ElevatedButton(
              onPressed: () {
                scaffoldKey.currentState!.showBottomSheet(
                  (context) => Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.white60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'BottomSheet',
                          style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        10.h,
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Text('BottomSheet'),
            ),
          ],
        ),
      ),
    );
  }
}
