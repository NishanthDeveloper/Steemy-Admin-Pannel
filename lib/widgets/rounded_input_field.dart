import 'package:flutter/material.dart';
import 'package:foxton_steemy_admin_pannel/widgets/text_field_container.dart';

import '../constants.dart';



class RoundedInputField extends StatefulWidget {
   RoundedInputField({Key? key, this.hintText, this.icon = Icons.person,required this.controller})
      : super(key: key);
  final String? hintText;
  final IconData icon;
   TextEditingController controller =TextEditingController();

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {


  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget.controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            icon: Icon(
              widget.icon,
              color: kPrimaryColor,
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontFamily: 'OpenSans'),
            border: InputBorder.none),
      ),
    );
  }
}
