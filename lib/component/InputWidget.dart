import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final myController = TextEditingController();
  late String labelText;
  final IconData chooseIcon;

  InputWidget(this.labelText,this.chooseIcon);

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
                  controller: myController,
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