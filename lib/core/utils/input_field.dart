import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoesly/core/utils/constants.dart';

class InputField extends StatefulWidget {
  final String hinText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  const InputField(this.hinText, this.controller, this.keyboardType,
      {super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.15,
      child: Focus(
        focusNode: _focusNode,
        child: TextField(
          textAlign: TextAlign.left,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: false,
          style: CustomTextStyle.headLine300black,
          decoration: InputDecoration(
            hintText: widget.hinText,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            border: InputBorder.none,
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 23,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: int.parse(widget.controller.text) > 1
                            ? Colors.black
                            : Colors.grey,
                        width: 2),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    // constraints: BoxConstraints(),
                    iconSize: 16,
                    splashRadius: 2,
                    color: int.parse(widget.controller.text) > 1
                        ? Colors.black
                        : Colors.grey,
                    icon: const Icon(FontAwesomeIcons.minus),
                    onPressed: () {
                      if (int.parse(widget.controller.text) > 1) {
                        setState(() {
                          widget.controller.text =
                              (int.parse(widget.controller.text) - 1)
                                  .toString();
                        });
                      }
                    },
                  ),
                ),
                Container(
                  height: 23,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 16,
                    color: Colors.black,
                    icon: const Icon(FontAwesomeIcons.plus),
                    onPressed: () {
                      setState(() {
                        widget.controller.text =
                            (int.parse(widget.controller.text) + 1).toString();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          onChanged: (value) {
            setState(() {});
          },
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
        ),
      ),
    );
  }
}
