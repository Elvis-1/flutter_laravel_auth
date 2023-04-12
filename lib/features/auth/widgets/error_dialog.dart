import 'package:get/get.dart';
import 'package:flutter/material.dart';

void _errorDialog(String message, context) {
  showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: const Text('An Errror Occurred'),
            content: Text(message),
            actions: [
              TextButton(onPressed: () => Get.back(), child: const Text('okay'))
            ],
          )));
}
