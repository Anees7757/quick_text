import 'package:flutter/material.dart';
import '../constants/constants.dart';

class Parser {
  final TextStyle? style;

  Parser({required this.style});

  TextSpan parseText(String text) {
    final baseStyle = (style ?? const TextStyle())
        .copyWith(color: style?.color ?? Colors.black);

    final pattern = RegExp(
        r'(\*\*(.*?)\*\*)|(\*(.*?)\*)|(_(.*?)_)|(~(.*?)~)|(\[(.*?)\]\(((#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{8}))|[a-zA-Z]+|https?:\/\/[^\s]+)\))');
    final matches = pattern.allMatches(text);

    if (matches.isEmpty) {
      // No more matches; return plain text
      return TextSpan(text: text, style: baseStyle);
    }

    final textSpans = <TextSpan>[];
    int lastMatchEnd = 0;

    for (final match in matches) {
      if (match.start > lastMatchEnd) {
        textSpans.add(parseText(text.substring(lastMatchEnd, match.start)));
      }

      if (match.group(1) != null) {
        // Bold
        textSpans.add(TextSpan(
          text: match.group(2),
          style: baseStyle.copyWith(fontWeight: FontWeight.bold),
          children: [parseText(match.group(2)!)],
        ));
      } else if (match.group(3) != null) {
        // Italic
        textSpans.add(TextSpan(
          text: match.group(4),
          style: baseStyle.copyWith(fontStyle: FontStyle.italic),
          children: [parseText(match.group(4)!)],
        ));
      } else if (match.group(5) != null) {
        // Underline
        textSpans.add(TextSpan(
          text: match.group(6),
          style: baseStyle.copyWith(decoration: TextDecoration.underline),
          children: [parseText(match.group(6)!)],
        ));
      } else if (match.group(7) != null) {
        // Strikethrough
        textSpans.add(TextSpan(
          text: match.group(8),
          style: baseStyle.copyWith(decoration: TextDecoration.lineThrough),
          children: [parseText(match.group(8)!)],
        ));
      } else if (match.group(9) != null) {
        // Color
        final displayText = match.group(10);
        final linkValue = match.group(11);
        if (linkValue!.startsWith('#')) {
          final color = _parseHexColor(linkValue);
          textSpans.add(TextSpan(
            text: displayText,
            style: baseStyle.copyWith(color: color),
            children: [parseText(displayText!)],
          ));
        } else {
          final color = _parseStringColor(linkValue);
          textSpans.add(TextSpan(
            text: displayText,
            style: baseStyle.copyWith(color: color),
            children: [parseText(displayText!)],
          ));
        }
      }

      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < text.length) {
      textSpans.add(parseText(text.substring(lastMatchEnd)));
    }

    return TextSpan(
      style: baseStyle,
      children: textSpans,
    );
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
}
