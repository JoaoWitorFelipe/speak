import 'locale_model.dart';

class WordModel {
  final String word;
  bool isCorrect;

  WordModel({
    required this.word,
    required this.isCorrect,
  });

  static List<WordModel> generateSimpleTextInEnglish() {
    final w1 = WordModel(word: "My", isCorrect: false);
    final w2 = WordModel(word: "name", isCorrect: false);
    final w3 = WordModel(word: "is", isCorrect: false);
    final w4 = WordModel(word: "Jhon", isCorrect: false);

    return [w1, w2, w3, w4];
  }

  static List<WordModel> generateSimpleTextInPortuguese() {
    final w1 = WordModel(word: "Meu", isCorrect: false);
    final w2 = WordModel(word: "nome", isCorrect: false);
    final w3 = WordModel(word: "é", isCorrect: false);
    final w4 = WordModel(word: "João", isCorrect: false);

    return [w1, w2, w3, w4];
  }

  static List<WordModel> generateSimpleTextByLocale(LocaleModel localeModel) {
    if (localeModel.localeId == "pt_BR") {
      return generateSimpleTextInPortuguese();
    }

    return generateSimpleTextInEnglish();
  }
}
