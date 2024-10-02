import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    't6lxp00z': {
      'es': 'Page Title',
      'en': 'Page Title',
    },
    '7tzz8srb': {
      'es': 'Button',
      'en': '',
    },
    'fvev0pkf': {
      'es': 'Bienvenido a la primera pantalla',
      'en': 'Welcome to the first screen',
    },
    'lfcvj50z': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // SecondPage
  {
    '11eyxq09': {
      'es': 'Button',
      'en': '',
    },
    'hj09xsky': {
      'es': 'Bienvenido a la segunda pantalla',
      'en': 'Welcome to the second screen',
    },
    'lk9qmdji': {
      'es': 'Page Title',
      'en': 'Page Title',
    },
    '4rc8mzfo': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Miscellaneous
  {
    'e9chicjk': {
      'es': 'This app needs the bluetooth access to connect',
      'en': '',
    },
    'cgkxp671': {
      'es': '',
      'en': '',
    },
    'rkqcx0b6': {
      'es': '',
      'en': '',
    },
    '9d33yj36': {
      'es': '',
      'en': '',
    },
    'tozujhty': {
      'es': '',
      'en': '',
    },
    'dns4jh5d': {
      'es': '',
      'en': '',
    },
    'easj3y9e': {
      'es': '',
      'en': '',
    },
    'fpqaveo4': {
      'es': '',
      'en': '',
    },
    'ukdp81d5': {
      'es': '',
      'en': '',
    },
    '65zszpnq': {
      'es': '',
      'en': '',
    },
    'f7dmvw16': {
      'es': '',
      'en': '',
    },
    'zmn07znb': {
      'es': '',
      'en': '',
    },
    'mxy9kh73': {
      'es': '',
      'en': '',
    },
    '6tj4lrjb': {
      'es': '',
      'en': '',
    },
    'pv70nkif': {
      'es': '',
      'en': '',
    },
    '0afmrynt': {
      'es': '',
      'en': '',
    },
    'itncu2ot': {
      'es': '',
      'en': '',
    },
    'uxrv9g3r': {
      'es': '',
      'en': '',
    },
    'w5bqmdhp': {
      'es': '',
      'en': '',
    },
    'fmw6hkhn': {
      'es': '',
      'en': '',
    },
    '1m4tzq6h': {
      'es': '',
      'en': '',
    },
    '3kmerrqr': {
      'es': '',
      'en': '',
    },
    'ha5nkl9x': {
      'es': '',
      'en': '',
    },
    '7r8arbt3': {
      'es': '',
      'en': '',
    },
    'b9178p3v': {
      'es': '',
      'en': '',
    },
    '97vpc5gu': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
