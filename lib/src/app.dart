import 'package:flutter/material.dart';

import 'presenter/listen_voice_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListenVoicePage(),
    );
  }
}
