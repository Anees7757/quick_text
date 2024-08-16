# TextPlus

TextPlus is a Flutter package that simplifies text formatting with markdown-like syntax. It allows developers to easily apply styles like bold, italic, underline, strikethrough, and color directly within a string, without the need to manually construct complex `TextSpan` trees.

<img height="300" src="https://raw.githubusercontent.com/Anees7757/text_plus/master/assets/images/2.png" alt=""/>

## Key Features

- **Simplified Syntax**: Style your text with symbols like `**bold**`, `*italic*`, `_underline_`, `~strikethrough~`, and `[colored](red)`.
- **Enhanced Readability**: Clean and easy-to-read code, reducing the verbosity of `RichText` and `TextSpan`.
- **Customizable Styles**: Includes options for text alignment, overflow, max lines, and more, providing the same flexibility as traditional Flutter text widgets.
- **Built-in Color Support**: Apply named colors directly within your text string.

## Why Use TextPlus?

- **Time-Saving**: Quickly format text without the hassle of constructing text spans.
- **User-Friendly**: Ideal for developers who want rich text features without the complexity.
- **Rich Functionality**: Despite its simplicity, TextPlus supports a wide range of text styling options.

## Sample Code

Here's how you can use TextPlus in your Flutter app:

```dart

TextPlus(
  'This is **bold** text.',
),

TextPlus(
  'This is *italic* text.',
),

TextPlus(
  'This is _underline_ text.',
),

TextPlus(
  'This is ~strikethrough~ text.',
),

TextPlus(
  'This is [colored](red) text.',
),
```

##Installation
Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  text_plus: ^1.0.0
```
Then run:
  
```bash
flutter pub get
```

Finally, import the package in your Dart code:

```dart
import 'package:text_plus/text_plus.dart';
```

## Limitations
* No Hex Color Support: Currently, TextPlus only supports named colors and does not support hex color codes.


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
