import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpPinInput extends StatefulWidget {
  const OtpPinInput({
    super.key,
    required this.onChanged,
    this.length = 6,
    this.enabled = true,
  });

  final int length;
  final bool enabled;
  final ValueChanged<String> onChanged;

  @override
  State<OtpPinInput> createState() => _OtpPinInputState();
}

class _OtpPinInputState extends State<OtpPinInput> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  String get _value => _controllers.map((controller) => controller.text).join();

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _notifyChange() {
    widget.onChanged(_value);
  }

  void _applyPastedValue(String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) {
      return;
    }

    for (var i = 0; i < widget.length; i++) {
      _controllers[i].text = i < digits.length ? digits[i] : '';
    }

    final targetIndex = digits.length >= widget.length ? widget.length - 1 : digits.length;
    if (targetIndex >= 0 && targetIndex < widget.length) {
      _focusNodes[targetIndex].requestFocus();
    }

    _notifyChange();
  }

  void _onChanged(int index, String value) {
    if (value.length > 1) {
      _applyPastedValue(value);
      return;
    }

    if (value.isEmpty) {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
      _notifyChange();
      return;
    }

    final digit = value.replaceAll(RegExp(r'\D'), '');
    _controllers[index].text = digit;
    _controllers[index].selection = TextSelection.collapsed(offset: digit.length);

    if (digit.isNotEmpty && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else {
      _focusNodes[index].unfocus();
    }

    _notifyChange();
  }

  KeyEventResult _handleKeyEvent(int index, KeyEvent event) {
    if (event is! KeyDownEvent) {
      return KeyEventResult.ignored;
    }

    if (event.logicalKey == LogicalKeyboardKey.backspace && _controllers[index].text.isEmpty && index > 0) {
      _controllers[index - 1].clear();
      _focusNodes[index - 1].requestFocus();
      _notifyChange();
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.length, (index) {
        final controller = _controllers[index];

        return SizedBox(
          width: 46,
          child: Focus(
            onKeyEvent: (node, event) => _handleKeyEvent(index, event),
            child: TextField(
              controller: controller,
              focusNode: _focusNodes[index],
              enabled: widget.enabled,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: Theme.of(context).textTheme.titleLarge,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(widget.length),
              ],
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: colors.surface,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colors.outlineVariant),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colors.primary, width: 1.6),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colors.outlineVariant),
                ),
              ),
              onTap: () {
                controller.selection = TextSelection(baseOffset: 0, extentOffset: controller.text.length);
              },
              onChanged: (value) => _onChanged(index, value),
            ),
          ),
        );
      }),
    );
  }
}
