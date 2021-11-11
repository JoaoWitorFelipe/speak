import 'package:speak/src/services/speech_text_service.dart';

import '../enums/voice_status.dart';
import 'speech_text_repository_interface.dart';

class SpeechTextRepository implements ISpeechTextRepository {
  final SpeechTextService _speechTextService = SpeechTextService();

  @override
  Future<void> init({
    required void Function(String) onListen,
    required void Function(VoiceStatus) onStatus,
    required String localeId,
  }) async {
    await _speechTextService.init(
      localeId: localeId,
      onListen: (String lastWords) {
        final List<String> split = lastWords.split(" ");
        final String lastWord = split[split.length - 1];
        onListen(lastWord);
      },
      onStatus: onStatus,
    );
  }
}
