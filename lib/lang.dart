import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppLang extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'message': 'What Is Your Name ?',
          'name': 'My Name IS Dhruv Soni.',
        },
        'hi_IN': {
          'message': 'आपका क्या नाम है ?',
          'name': 'मेरा नाम ध्रुव सोनी है|',
        },
        'gu_IN': {
          'message': 'તમારું નામ શું છે ?',
          'name': 'મારું નામ ધ્રુવ સોની છે.',
        },
      };
}
