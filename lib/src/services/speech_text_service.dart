import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../enums/voice_status.dart';

class SpeechTextService {
  final SpeechToText _speechToText = SpeechToText();

  Future<void> dispose() async {
    await _speechToText.stop();
  }

  Future<void> init({
    required void Function(String) onListen,
    required void Function(VoiceStatus) onStatus,
    required String localeId,
  }) async {
    final bool isInitialize = await _speechToText.initialize();

    if (isInitialize) {
      _speechToText.listen(
        localeId: localeId,
        onResult: (SpeechRecognitionResult result) {
          onListen(result.recognizedWords);
        },
      );
      _speechToText.statusListener = (String status) {
        _onTranformStatusToEnum(status, onStatus);
      };
    }
  }

  Future<void> changeSpeechLanguage() async {}

  _onTranformStatusToEnum(String status, Function(VoiceStatus) onStatus) {
    switch (status) {
      case "done":
        onStatus(VoiceStatus.done);
        break;
      case "listening":
        onStatus(VoiceStatus.listening);
        break;
      case "notListening":
        onStatus(VoiceStatus.notListening);
        break;
      default:
        onStatus(VoiceStatus.error);
    }
  }
}
