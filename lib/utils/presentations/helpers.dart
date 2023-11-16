import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sleektask/utils/presentations/easy_localization.dart';
import 'package:sleektask/utils/presentations/get_it.dart';



String capitalizeSentence(String wordsString) {
  wordsString = wordsString.toLowerCase();
  var wordList = wordsString.split(' ');
  return wordList.map((e) => capitalizeSingleWord(e)).join(' ');
}

String capitalizeSingleWord(String word) {
  if (word.isEmpty) {
    return word;
  } else if (word.length == 1) {
    return word[0].toUpperCase();
  } else {
    return '${word[0].toUpperCase()}${word.substring(1)}';
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  return displaySize(context).width;
}

// bool isDark(BuildContext context) {
//   // return context.read<AppSettingsProvider>().isDark;
// }



extension TranslationExtensionText on Text {
  Text translate({Map<String, String>? namedArgs}) => Text(
        getSingleton<EasyLocalizationProvider>().translate(data, namedArgs),
        key: key,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
      );
}

extension StringExtensions on String {
  String translate({Map<String, String>? namedArgs}) {
    String retString = this;
    try {
      retString =
          getSingleton<EasyLocalizationProvider>().translate(this, namedArgs);
      return retString;
    } catch (_) {
      return retString;
    }
  }

  String capitalize() => capitalizeSentence(this);

  String handleOverflow(int length) {
    return this.length > length ? '${substring(0, length)}...' : this;
  }
}

bool isNumeric(String s) {
  if (s.isEmpty) {
    return false;
  }
  return double.tryParse(s) != null;
}

extension ListExtension on List<String> {
  bool containsSubString(String subStr) {
    return any((element) => element.contains(subStr));
  }
}

extension PaddingExtension on Widget {
  Widget pad(EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }
}

// String convertTimeSlot(String? time) {
//   return (formatDate(
//           parseFromDateStringUsingFormat(time?.split(':')[0] ?? '', 'h'),
//           'h a') ??
//       '');
// }

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

void multiShipmentOriginEditRemovalDialog(BuildContext context) async {
  // bool? removeItems = await showRemoveCartItemsDialog(context);
  // if (removeItems != null && removeItems) {
  //   Journey.resetFields();
  //   Navigator.pushNamedAndRemoveUntil(
  //       context, HomeScreen.routeName, (route) => false);
  // }
}
