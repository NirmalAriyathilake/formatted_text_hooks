import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formatted_text/formatted_text.dart';

class _FormattedTextControllerHookCreator {
  const _FormattedTextControllerHookCreator();

  /// Creates a [FormattedTextEditingController] that will be disposed automatically.
  ///
  /// The [text] parameter can be used to set the initial value of the
  /// controller.
  FormattedTextEditingController call({
    String? text,
    List<Object?>? keys,
    List<FormattedTextFormatter>? formatters,
  }) {
    return use(_FormattedTextControllerHook(
      text,
      keys,
      formatters,
    ));
  }

  /// Creates a [FormattedTextEditingController] from the initial [value] that will
  /// be disposed automatically.
  FormattedTextEditingController fromValue(
    TextEditingValue value, {
    List<Object?>? keys,
    List<FormattedTextFormatter>? formatters,
  }) {
    return use(_FormattedTextControllerHook.fromValue(
      value,
      keys,
      formatters,
    ));
  }
}

/// Creates a [FormattedTextEditingController], either via an initial text or an initial
/// [TextEditingValue].
///
/// To use a [FormattedTextEditingController] with an optional initial text, use
/// ```dart
/// final controller = useFormattedTextController(text: 'initial text');
/// ```
///
/// To use a [FormattedTextEditingController] with an optional initial value, use
/// ```dart
/// final controller = useFormattedTextController
///   .fromValue(TextEditingValue.empty);
/// ```
///
/// Changing the text or initial value after the widget has been built has no
/// effect whatsoever. To update the value in a callback, for instance after a
/// button was pressed, use the [FormattedTextEditingController.text] or
/// [FormattedTextEditingController.value] setters. To have the [FormattedTextEditingController]
/// reflect changing values, you can use [useEffect]. This example will update
/// the [FormattedTextEditingController.text] whenever a provided [ValueListenable]
/// changes:
/// ```dart
/// final controller = useFormattedTextController();
/// final update = useValueListenable(myTextControllerUpdates);
///
/// useEffect(() {
///   controller.text = update;
/// }, [update]);
/// ```
///
/// See also:
/// - [FormattedTextEditingController], which this hook creates.
const useFormattedTextController = _FormattedTextControllerHookCreator();

class _FormattedTextControllerHook
    extends Hook<FormattedTextEditingController> {
  const _FormattedTextControllerHook(
    this.initialText, [
    List<Object?>? keys,
    this.formatters,
  ])  : initialValue = null,
        super(keys: keys);

  const _FormattedTextControllerHook.fromValue(
    this.initialValue, [
    List<Object?>? keys,
    this.formatters,
  ])  : initialText = null,
        super(keys: keys);

  final List<FormattedTextFormatter>? formatters;
  final String? initialText;
  final TextEditingValue? initialValue;

  @override
  _FormattedTextControllerHookState createState() {
    return _FormattedTextControllerHookState();
  }
}

class _FormattedTextControllerHookState extends HookState<
    FormattedTextEditingController, _FormattedTextControllerHook> {
  late final _controller = hook.initialValue != null
      ? FormattedTextEditingController.fromValue(
          hook.initialValue,
          formatters: hook.formatters,
        )
      : FormattedTextEditingController(
          text: hook.initialText,
          formatters: hook.formatters,
        );

  @override
  String get debugLabel => 'useFormattedTextController';

  @override
  void dispose() => _controller.dispose();

  @override
  FormattedTextEditingController build(BuildContext context) => _controller;
}
