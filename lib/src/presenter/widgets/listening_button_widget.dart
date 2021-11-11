import 'package:flutter/material.dart';

import '../../enums/voice_status.dart';

class ListeningButtonWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const ListeningButtonWidget({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      onPressed: onPressed,
    );
  }
}
