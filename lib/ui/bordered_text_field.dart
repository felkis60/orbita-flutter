import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BorderedTextField extends StatelessWidget {
  String labelText;
  Function(String) onChanged;
  
  BorderedTextField({
    this.labelText,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 3.0
          ),
          borderRadius: BorderRadius.all(Radius.circular(15.0))
        )
      ),
    );
  }
}