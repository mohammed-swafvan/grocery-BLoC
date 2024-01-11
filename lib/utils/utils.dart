import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {
  static customSnackBar({required bool isAdding, required BuildContext context, required String content}) {
    return Flushbar(
      margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
      borderRadius: BorderRadius.circular(12),
      messageText: Container(
        alignment: Alignment.center,
        child: Text(
          content,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 3),
      backgroundColor: isAdding ? Colors.teal : Colors.red,
    ).show(context);
  }
}
