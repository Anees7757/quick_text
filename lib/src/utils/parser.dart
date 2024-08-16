import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Parser {
  final TextStyle? style;

  Parser({required this.style});

  TextSpan parseText(String text) {
    final baseStyle = (style ?? const TextStyle())
        .copyWith(color: style?.color ?? Colors.black);
    final textSpans = <TextSpan>[];

    final pattern = RegExp(
        r'(\*\*(.*?)\*\*)|(\*(.*?)\*)|(_(.*?)_)|(~(.*?)~)|(\[(.*?)\]\((.*?)\))');
    final matches = pattern.allMatches(text);

    int lastMatchEnd = 0;
    for (final match in matches) {
      if (match.start > lastMatchEnd) {
        textSpans.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: baseStyle,
        ));
      }

      if (match.group(1) != null) {
        textSpans.add(TextSpan(
          text: match.group(2),
          style: baseStyle.copyWith(fontWeight: FontWeight.bold),
        ));
      } else if (match.group(3) != null) {
        textSpans.add(TextSpan(
          text: match.group(4),
          style: baseStyle.copyWith(fontStyle: FontStyle.italic),
        ));
      } else if (match.group(5) != null) {
        textSpans.add(TextSpan(
          text: match.group(6),
          style: baseStyle.copyWith(decoration: TextDecoration.underline),
        ));
      } else if (match.group(7) != null) {
        textSpans.add(TextSpan(
          text: match.group(8),
          style: baseStyle.copyWith(decoration: TextDecoration.lineThrough),
        ));
      } else if (match.group(9) != null) {
        final color = _parseColor(match.group(11));
        textSpans.add(TextSpan(
          text: match.group(10),
          style: baseStyle.copyWith(color: color),
        ));
      }

      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < text.length) {
      textSpans.add(TextSpan(
        text: text.substring(lastMatchEnd),
        style: baseStyle,
      ));
    }

    return TextSpan(
      style: baseStyle,
      children: textSpans,
    );
  }

  Color _parseColor(String? colorString) {
    return colorMap[colorString] ?? Colors.black;
  }
}
