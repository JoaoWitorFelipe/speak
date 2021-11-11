import 'dart:async';

import 'package:speak/src/enums/voice_status.dart';

import '../models/word_model.dart';
import '../models/locale_model.dart';
import '../repositories/speech_text_repository.dart';
import '../repositories/speech_text_repository_interface.dart';

class HomeBloc {
  LocaleModel selectedLocale = LocaleModel.english();
  List<WordModel> comparableWords = WordModel.generateSimpleTextInEnglish();

  final _streamController = StreamController<List<WordModel>>();
  final _streamStatusController = StreamController<VoiceStatus>();
  final _streamLocaleController = StreamController<LocaleModel>();

  final ISpeechTextRepository repository = SpeechTextRepository();

  Stream<List<WordModel>> get stream => _streamController.stream;
  Stream<VoiceStatus> get streamStatus => _streamStatusController.stream;
  Stream<LocaleModel> get streamLocale => _streamLocaleController.stream;

  Future<void> init() async {
    _resetData();
    await repository.init(
      localeId: selectedLocale.localeId,
      onListen: _onListen,
      onStatus: _onStatus,
    );
  }

  void changeSpeechLanguage(LocaleModel localeModel) {
    final newWords = WordModel.generateSimpleTextByLocale(localeModel);
    selectedLocale = localeModel;
    comparableWords = newWords;
    _streamLocaleController.sink.add(localeModel);
    _streamController.sink.add(newWords);
  }

  void _onListen(String word) {
    final index =
        comparableWords.indexWhere((element) => element.word.contains(word));
    final indexFound = index > (-1);
    if (indexFound) {
      final model = comparableWords[index];
      model.isCorrect = true;
      comparableWords[index] = model;
      _streamController.sink.add(comparableWords);
    }
  }

  void _onStatus(VoiceStatus status) {
    _streamStatusController.sink.add(status);
  }

  void _resetData() {
    for (WordModel item in comparableWords) {
      item.isCorrect = false;
    }
  }
}
