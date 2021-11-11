import 'package:flutter/material.dart';

import '../blocs/home_bloc.dart';
import '../models/word_model.dart';
import '../enums/voice_status.dart';
import '../models/locale_model.dart';
import 'widgets/list_text_widget.dart';
import 'widgets/listening_button_widget.dart';

class ListenVoicePage extends StatelessWidget {
  final HomeBloc homeBloc = HomeBloc();

  ListenVoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SPEAK"),
        actions: <Widget>[
          StreamBuilder<LocaleModel>(
              stream: homeBloc.streamLocale,
              initialData: homeBloc.selectedLocale,
              builder: (context, snapshot) {
                final locale = snapshot.data!;
                return PopupMenuButton(
                  icon: Text(
                    locale.flag,
                    style: const TextStyle(fontSize: 24.0),
                  ),
                  onSelected: homeBloc.changeSpeechLanguage,
                  itemBuilder: (_) {
                    return <PopupMenuEntry<LocaleModel>>[
                      PopupMenuItem(
                        child: Text(LocaleModel.brazil().flag),
                        value: LocaleModel.brazil(),
                      ),
                      PopupMenuItem(
                        child: Text(LocaleModel.english().flag),
                        value: LocaleModel.english(),
                      ),
                    ];
                  },
                );
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            StreamBuilder(
              initialData: homeBloc.comparableWords,
              stream: homeBloc.stream,
              builder: (_, AsyncSnapshot<List<WordModel>> snapshot) {
                return ListTextWidget(words: snapshot.data!);
              },
            ),
            StreamBuilder(
              initialData: VoiceStatus.notListening,
              stream: homeBloc.streamStatus,
              builder: (_, AsyncSnapshot<VoiceStatus> snapshot) {
                final status = snapshot.data!;
                final bool isListening = (status == VoiceStatus.listening);
                return ListeningButtonWidget(
                  child: Text(isListening ? "Listening" : "Start"),
                  onPressed: isListening
                      ? null
                      : () async {
                          await homeBloc.init();
                        },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
