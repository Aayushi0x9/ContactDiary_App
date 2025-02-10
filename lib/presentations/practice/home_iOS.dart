import 'package:contact_dairy_app/exe.dart';
import 'package:contact_dairy_app/presentations/practice/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeIos extends StatefulWidget {
  const HomeIos({super.key});

  @override
  State<HomeIos> createState() => _HomeIosState();
}

class _HomeIosState extends State<HomeIos> {
  @override
  Widget build(BuildContext context) {
    ProviderPlatform provider = Provider.of<ProviderPlatform>(context);
    ProviderPlatform listen =
        Provider.of<ProviderPlatform>(context, listen: true);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('iOS App'),
        trailing: CupertinoSwitch(
          value: provider.isAndroid,
          onChanged: (value) {
            listen.changePlatform();
          },
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              borderRadius: BorderRadius.circular(15),
              child: Text(
                  "${provider.date.day}/${provider.date.month}/${provider.date.year}"),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => Container(
                    height: 300,
                    width: double.infinity,
                    color: CupertinoColors.white,
                    child: CupertinoDatePicker(
                      initialDateTime: provider.date,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (DateTime value) {
                        provider.changeDate(d1: value);
                      },
                    ),
                  ),
                );
              },
            ),
            20.h,
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              borderRadius: BorderRadius.circular(15),
              child: Text("${provider.time.hour}:${provider.time.minute}"),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => Container(
                    height: 300,
                    width: double.infinity,
                    color: CupertinoColors.white,
                    child: CupertinoDatePicker(
                      initialDateTime:
                          DateTime(provider.time.hour, provider.time.minute),
                      mode: CupertinoDatePickerMode.time,
                      onDateTimeChanged: (value) {
                        TimeOfDay time =
                            TimeOfDay(hour: value.hour, minute: value.minute);
                        provider.changeTime(t1: time);
                      },
                    ),
                  ),
                );
              },
            ),
            20.h,
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              borderRadius: BorderRadius.circular(15),
              child: const Text('AlertDialog'),
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: const Text('Alert'),
                      content: const Text('Are you sure to exit'),
                      actions: [
                        CupertinoDialogAction(
                            child: const Text('Yes'),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        CupertinoDialogAction(
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            20.h,
            CupertinoButton(
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    title: const Text('Select One'),
                    actions: [
                      CupertinoActionSheetAction(
                        child: const Text('Camera',
                            style:
                                TextStyle(color: CupertinoColors.activeBlue)),
                        onPressed: () {},
                      ),
                      CupertinoActionSheetAction(
                        child: const Text(
                          'Gallery',
                          style: TextStyle(color: CupertinoColors.activeBlue),
                        ),
                        onPressed: () {},
                      ),
                      CupertinoActionSheetAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          // style: TextStyle(color: CupertinoColors.activeBlue),
                        ),
                      ),
                    ],
                  ),
                );
              },
              color: CupertinoColors.activeBlue,
              borderRadius: BorderRadius.circular(15),
              child: const Text('ModelBottomSheet'),
            ),
          ],
        ),
      ),
    );
  }
}
