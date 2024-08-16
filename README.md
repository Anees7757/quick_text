# QuickText

QuickText is a Flutter package that simplifies text formatting with markdown-like syntax. It allow you to easily apply styles like bold, italic, underline, strikethrough, and color directly within a string, without the need to manually construct complex `TextSpan` trees. Similiarusage like `Text` widget.

<img height="300" src="https://raw.githubusercontent.com/Anees7757/quick_text/master/assets/images/2.png" alt=""/>

## Key Features

- **Simplified Syntax**: Style your text with symbols like `**bold**`, `*italic*`, `_underline_`, `~strikethrough~`, and `[colored](red)`.
- **Enhanced Readability**: Clean and easy-to-read code, reducing the verbosity of `RichText` and `TextSpan`.
- **Customizable Styles**: Includes options for text alignment, overflow, max lines, and more, providing the same flexibility as traditional Flutter text widgets.
- **Built-in Color Support**: Apply named colors directly within your text string.

## Why Use QuickText?

- **Time-Saving**: Quickly format text without the hassle of constructing text spans.
- **User-Friendly**: Ideal for developers who want rich text features without the complexity.
- **Rich Functionality**: Despite its simplicity, QuickText supports a wide range of text styling options.

## Sample Code

Here's how you can use QuickText in your Flutter app:

```dart

QuickText(
  'This is **bold** text.',
),

QuickText(
  'This is *italic* text.',
),

QuickText(
  'This is _underline_ text.',
),

QuickText(
  'This is ~strikethrough~ text.',
),

QuickText(
  'This is [colored](red) text.',
),
```

##Installation
Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  quick_text: ^1.0.0
```
Then run:
  
```bash
flutter pub get
```

Finally, import the package in your Dart code:

```dart
import 'package:quick_text/quick_text.dart';
```

## Limitations
* No Hex Color Support: Currently, QuickText only supports named colors and does not support hex color codes.


## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for new features, please open an issue on GitHub.

### Fork the repository.
1. Create your feature branch (`git checkout -b feature/AmazingFeature`).
2. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
3. Push to the branch (`git push origin feature/AmazingFeature`).
4. Open a pull request.

## Issues
If you run into any issues, please file a bug report on our GitHub Issues page. Include detailed steps to reproduce the problem and any relevant code snippets.

## License
This package is licensed under the **MIT License**. See the LICENSE file for more details.
