# QuickText

QuickText is a Flutter package that simplifies text formatting with markdown-like syntax. It allow you to easily apply styles like bold, italic, underline, strikethrough color and links directly within a string, without the need to manually construct complex `TextSpan` trees. Similiar usage like `Text` widget.

<img height="300" src="https://raw.githubusercontent.com/Anees7757/quick_text/master/assets/images/1.png" alt=""/>

## Key Features

- **Simplified Syntax**: Style your text with symbols like `**bold**`, `*italic*`, `_underline_`, `~strikethrough~`, `[colored](red)`, `[colored](#FF0000)` and `[link](https://example.com)`.
- **Enhanced Readability**: Clean and easy-to-read code, reducing the verbosity of `RichText` and `TextSpan`.
- **Customizable Styles**: Includes options for text alignment, overflow, max lines, and more, providing the same flexibility as traditional Flutter text widgets.
- **Built-in Color Support**: Apply named or hex colors directly within your text string.

## Why Use QuickText?

- **Time-Saving**: Quickly format text without the hassle of constructing text spans.
- **User-Friendly**: Ideal for developers who want rich text features without the complexity.
- **Rich Functionality**: Despite its simplicity, QuickText supports a wide range of text styling options.

## Sample Code

Here's how you can use QuickText in your Flutter app:

```dart

// Bold

QuickText(
  'This is **bold** text.',
),

// Italic

QuickText(
  'This is *italic* text.',
),

// Underline

QuickText(
  'This is _underline_ text.',
),

// Strikethrough

QuickText(
  'This is ~strikethrough~ text.',
),

// Using named colors

QuickText(
  'This is [colored](red) text.',
),

// Using hex colors

QuickText(
  'This is [colored](#FF0000) text.',
),

// links

QuickText(
  'This is [link](https://example.com).',
),

```

## Installation

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  quick_text: ^latest_version
```
Then run:
  
```bash
flutter pub get
```

Finally, import the package in your Dart code:

```dart
import 'package:quick_text/quick_text.dart';
```