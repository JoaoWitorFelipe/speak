import 'package:speak/src/enums/voice_status.dart';

abstract class ISpeechTextRepository {
  Future<void> init({
    required void Function(String) onListen,
    required void Function(VoiceStatus) onStatus,
    required String localeId,
  });
}
