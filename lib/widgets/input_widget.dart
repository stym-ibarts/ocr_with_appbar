import 'package:flutter/material.dart';

// import '../utils/validator.dart';
// import 'package:pharmygr/core/presentation/theme/app_theme_data.dart';

class InputWidget extends StatefulWidget {
  final String? initialValue;
  final String? label;
  final String? placeholder;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool isRequired;

  const InputWidget({
    this.initialValue,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.label,
    this.placeholder,
    this.textInputAction,
    this.keyboardType,
    this.isRequired = false,
    super.key,
  });
//  Validator get validate => 
  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChanged);
    _controller = TextEditingController();
    _controller.text = widget.initialValue ?? '';
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus) {
      Scrollable.ensureVisible(context);
    }
  }


  

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            controller: _controller,
            focusNode: _focusNode,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            textInputAction: widget.textInputAction ?? TextInputAction.next,
            onChanged: widget.onChanged,
            onSaved: (String? value) {
              if (value != null && widget.onSaved != null) {
                widget.onSaved!(value);
              }
            },
            validator: (String? value) {
              if (widget.validator != null) {
                return widget.validator!(value);
              }
              return null;
            },
            style: const TextStyle(
              // color: context.colorScheme.onSecondary,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              isDense: true,
              fillColor: const Color(0xFFE3E3E3),
              filled: true,
              border: const OutlineInputBorder(
                // borderSide:
                    // BorderSide(color: context.colorScheme.outline, width: 2),
              ),
              hintText: widget.placeholder ?? widget.label,
              hintStyle: const TextStyle(fontSize: 16),
              labelStyle: const TextStyle(fontSize: 16),
              labelText: "${widget.label} ${widget.isRequired ? "*" : ''}",
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
