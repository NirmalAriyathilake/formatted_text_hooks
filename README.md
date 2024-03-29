[![pub package](https://img.shields.io/pub/v/formatted_text_hooks?color=orange)](https://pub.dartlang.org/packages/formatted_text_hooks)
[![BSD-3-Clause License](https://img.shields.io/github/license/NirmalAriyathilake/formatted_text_hooks)](https://github.com/NirmalAriyathilake/formatted_text_hooks/blob/main/LICENSE)

- [Introduction](#introduction)
- [Getting Started](#getting-Started)
- [Usage examples](#usage-examples)
  - [Text View](#text-view)
  - [Text Editing Controller](#text-editing-controller)
  - [Context Menu Builder](#context-menu-builder)
  - [Selection controls](#selection-controls)
  - [Custom Formatters](#custom-formatters)
  - [Custom Toolbar Actions](#custom-toolbar-actions)
- [Note](#note)
- [Issues](#issues)
- [Author](#author)

## Introduction

- Formatted Text is a Text formatting package.
- One text can be wrapped aroung with multiple patterns to apply multiple `TextStyles` merged together. ( All `TextStyles` should be able to merged together )
- Child wrappers can be applied to substrings and they will be merged with parenet wrapper style. ( All `TextStyles` should be able to merged together )

- This package includes,
  - Text View
  - Text Editing Controller
  - Selection toolbar

### Packages

formatted_text - [![Formatted Text Package](https://img.shields.io/pub/v/formatted_text?color=orange&label=formatted_text)](https://pub.dartlang.org/packages/formatted_text)

formatted_text_hooks - [![Formatted Text Hooks Package](https://img.shields.io/pub/v/formatted_text_hooks?color=orange&label=formatted_text_hooks)](https://pub.dartlang.org/packages/formatted_text_hooks)

## Getting Started

### Add as a dependency

```yaml
dependencies:
  formatted_text: [latest-version]
```

If you are using `flutter_hooks` use `formatted_text_hooks`

```yaml
dependencies:
  formatted_text_hooks: [latest-version]
```

### Import package

```dart
import 'package:formatted_text/formatted_text.dart';
```

If using `formatted_text_hooks`

```dart
import 'package:formatted_text_hooks/formatted_text_hooks.dart';
```

## Usage examples

### Text View

#### Bold

```dart
FormattedText('*This text is bold*');
```

![Bold Text Image](https://github.com/NirmalAriyathilake/formatted_text_hooks/blob/main/resources/bold_text.png?raw=true)

#### Italic

```dart
FormattedText('_This text is Italic_');
```

![Italic Text Image](https://github.com/NirmalAriyathilake/formatted_text_hooks/blob/main/resources/italic_text.png?raw=true)

Strikethrough (`~`) and Underline (`#`) are also available as default formatters

#### Multi styling substrings

```dart
FormattedText('_This is *Bold Italic* Italic_');
```

![Multistyling substring Image](https://github.com/NirmalAriyathilake/formatted_text_hooks/blob/main/resources/multistyling_substring.png?raw=true)

#

### Text Editing Controller

```dart
final textEditingController = FormattedTextEditingController();
```

or with hooks

```dart
final textEditingController = useFormattedTextController();
```

#

### Custom Formatters

- Providing custom formatters will override the default formatters.

```dart
FormattedText(
  '==This text is orange==',
  formatters: [
    ... FormattedTextDefaults.formattedTextDefaultFormatters, // To add default formatters
    FormattedTextFormatter(
      patternChars: '==', // Pattern char(s)
      style: TextStyle(color: Colors.orange),
    )
  ],
)
```

#

### Context Menu Builder

To get adaptive text selection toolbar with default formatter menu items,

```dart
contextMenuBuilder: (BuildContext context,
    EditableTextState editableTextState) {
  return FormattedTextContextMenuBuilder
    .adaptiveTextSelectionToolbar(
      editableTextState: editableTextState);
}
```

### Custom Context Menu Builder Items

- Providing custom menu items will override the default formatter items.
- Don't escape `patternChars`.

```dart
contextMenuBuilder: (BuildContext context,
    EditableTextState editableTextState) {
  return FormattedTextContextMenuBuilder
      .adaptiveTextSelectionToolbar(
    editableTextState: editableTextState,
    items: [
      ...FormattedTextDefaults
          .formattedTextDefaultContextMenuItems, // Default formatters
      const FormattedTextContextMenuItem(
        label: 'Orange',
        patternChars: '==',
      ),
    ],
  );
},
```

Or

- Use context menu button items

```dart
contextMenuBuilder: (BuildContext context,
    EditableTextState editableTextState) {
  return AdaptiveTextSelectionToolbar.buttonItems(
    anchors: editableTextState.contextMenuAnchors,
    buttonItems: [
      ...editableTextState.contextMenuButtonItems,
      ...FormattedTextDefaults
          .formattedTextDefaultContextMenuButtonItems(
              editableTextState),
      FormattedTextContextMenuBuilder
          .buildContextMenuButtonItem(
        editableTextState: editableTextState,
        item: const FormattedTextContextMenuItem(
          label: 'Orange',
          patternChars: '==',
        ),
      ),
    ],
  );
}
```

#

### [DEPRECATED]

Use [Context Menu Builder](#context-menu-builder)

### Selection controls

To display custom selection controls,

```dart
selectionControls: FormattedTextSelectionControls(),
```

Modify cut / copy / paste / select all action availability using `Toolbar Options`

```dart
toolbarOptions: ToolbarOptions(
  cut: false,
  copy: false,
  paste: false,
  selectAll: true,
)
```

![Custom Formatter Image - Orange Text](https://github.com/NirmalAriyathilake/formatted_text_hooks/blob/main/resources/custom_formatter.png?raw=true)

### Custom Toolbar Actions

- Providing custom actions will override the default actions except cut / copy / paste / select all.
- Don't escape `patternChars`.

```dart
selectionControls: FormattedTextSelectionControls(
  actions: [
    ... FormattedTextDefaults.formattedTextToolbarDefaultActions, // To add default actions
    FormattedTextToolbarAction(
      label: 'Orange',
      patternChars: '==',
    )
  ],
)
```

## Note

- All formatter patterns must be distinctive
- Child patterns which are already applied will be considered normal text
- Child styles should be able to merge with parent styles

## Issues

Please file any issues, bugs or feature requests as an issue on our [GitHub](https://github.com/NirmalAriyathilake/formatted_text_hooks/issues) page.

## Author

This Formatted Text Hooks package is developed by [NirmalCode](https://nirmalcode.com).
