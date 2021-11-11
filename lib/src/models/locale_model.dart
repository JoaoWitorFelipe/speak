class LocaleModel {
  final String flag;
  final String localeId;

  LocaleModel({required this.flag, required this.localeId});

  factory LocaleModel.english() {
    return LocaleModel(flag: "🇺🇸", localeId: "en_US");
  }

  factory LocaleModel.brazil() {
    return LocaleModel(flag: "🇧🇷", localeId: "pt_BR");
  }
}
