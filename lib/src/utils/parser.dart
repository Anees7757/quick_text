import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/constants.dart';

class Parser {
  final TextStyle? style;

  Parser({required this.style});

  TextSpan parseText(String text) {
    final baseStyle = (style ?? const TextStyle())
        .copyWith(color: style?.color ?? Colors.black);
    final textSpans = <TextSpan>[];

    final matches = _parseRecursively(text, baseStyle);

    textSpans.addAll(matches);

    return TextSpan(
      style: baseStyle,
      children: textSpans,
    );
  }

  List<TextSpan> _parseRecursively(String text, TextStyle currentStyle) {
    final textSpans = <TextSpan>[];
    final pattern = RegExp(
        r'(\*\*(.*?)\*\*)|(\*(.*?)\*)|(_(.*?)_)|(~(.*?)~)|(\[(.*?)\]\(((#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{8}))|[a-zA-Z:/.\-_]+)\))');
    final matches = pattern.allMatches(text);

    int lastMatchEnd = 0;
    for (final match in matches) {
      if (match.start > lastMatchEnd) {
        textSpans.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: currentStyle,
        ));
      }

      if (match.group(1) != null) {
        // Bold
        textSpans.add(TextSpan(
            children: _parseRecursively(match.group(2)!,
                currentStyle.copyWith(fontWeight: FontWeight.bold))));
      } else if (match.group(3) != null) {
        // Italic
        textSpans.add(TextSpan(
            children: _parseRecursively(match.group(4)!,
                currentStyle.copyWith(fontStyle: FontStyle.italic))));
      } else if (match.group(5) != null) {
        // Underline
        textSpans.add(TextSpan(
            children: _parseRecursively(match.group(6)!,
                currentStyle.copyWith(decoration: TextDecoration.underline))));
      } else if (match.group(7) != null) {
        // Strikethrough
        textSpans.add(TextSpan(
            children: _parseRecursively(
                match.group(8)!,
                currentStyle.copyWith(
                    decoration: TextDecoration.lineThrough))));
      } else if (match.group(9) != null) {
        // Link or color text
        final displayText = match.group(10);
        final colorValue = match.group(11);

        Color color;
        if (colorValue!.startsWith('#')) {
          color = _parseHexColor(colorValue);
        } else if (_isValidUrl(colorValue)) {
          // Handle as a clickable link
          textSpans.add(TextSpan(
            text: displayText,
            style: currentStyle.copyWith(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                _launchUrl(colorValue);
              },
          ));
          lastMatchEnd = match.end;
          continue;
        } else {
          color = _parseStringColor(colorValue);
        }

        // Handle as colored text
        textSpans.add(TextSpan(
          children: _parseRecursively(
              displayText!, currentStyle.copyWith(color: color)),
        ));
      }

      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < text.length) {
      textSpans.add(TextSpan(
        text: text.substring(lastMatchEnd),
        style: currentStyle,
      ));
    }

    return textSpans;
  }

  Color _parseStringColor(String colorString) {
    return colorMap[colorString] ?? Colors.black;
  }

  Color _parseHexColor(String colorString) {
    try {
      return Color(int.parse('0xff${colorString.substring(1)}'));
    } catch (e) {
      return Colors.black;
    }
  }

  bool _isValidUrl(String url) {
    final uri = Uri.tryParse(url);
    return uri != null && (uri.hasScheme || url.contains(RegExp(r'https?://')));
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (await canLaunchUrl(uri!)) {
      await launchUrl(uri);
    }
  }
}
