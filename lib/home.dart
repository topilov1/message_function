import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  String sms = 'assalomu alaykum';
  bool deleteAll = false;
  bool delete = false;

  bool ozgertirish = false;
  _copy() {
    final value = ClipboardData(text: sms);
    Clipboard.setData(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 200),
            deleteAll
                ? const SizedBox()
                : delete
                    ? const SizedBox()
                    : TextButton(
                        onPressed: (() {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                actions: [
                                  Column(
                                    children: [
                                      // delete All
                                      smsFunction(
                                        onTap: (() {
                                          Navigator.of(context).pop();
                                          setState(() {});
                                          deleteAll = true;
                                        }),
                                        text: 'delete All',
                                        icon: Icons.delete_sharp,
                                      ),

                                      // delete
                                      smsFunction(
                                        onTap: (() {
                                          Navigator.of(context).pop();
                                          delete = true;
                                          setState(() {});
                                        }),
                                        text: 'Delete',
                                        icon: Icons.delete_outline,
                                      ),

                                      // change
                                      smsFunction(
                                        onTap: (() {
                                          Navigator.of(context).pop();
                                          ozgertirish = true;
                                          setState(() {});
                                        }),
                                        text: 'Change',
                                        icon: Icons.edit_outlined,
                                      ),

                                      // Copy
                                      smsFunction(
                                        onTap: (() {
                                          Navigator.of(context).pop();
                                          ozgertirish = true;
                                          sms;
                                        }),
                                        text: 'Copy',
                                        icon: Icons.content_copy,
                                      )
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        }),

                        // message
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            sms,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

            const SizedBox(height: 100),

            // input
            Expanded(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    width: double.infinity,
                    height: 60,
                    child: TextField(
                      controller: controller,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: (() {
                      if (ozgertirish = true) {
                        print(ozgertirish);

                        sms = controller.value.text;
                        ozgertirish = false;
                        setState(() {});
                        print(ozgertirish);
                      }
                    }),
                    child: const Text('save'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget smsFunction({
    required GestureTapCallback? onTap,
    required String? text,
    required IconData? icon,
  }) {
    return GestureDetector(
      onTap: onTap!,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon!),
            const SizedBox(width: 30),
            Expanded(child: Text(text!))
          ],
        ),
      ),
    );
  }
}
