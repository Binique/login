import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  late String labelText;
  final IconData chooseIcon;
  final controllerField;

  InputWidget(this.labelText,this.chooseIcon,this.controllerField);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: Container(
          width: 350,
            decoration: BoxDecoration(
              color: Colors.transparent?.withOpacity(0.5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Form(
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: controllerField,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: labelText,
                    prefixIcon:
                    Icon(
                      chooseIcon,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ),
    );
  }
}