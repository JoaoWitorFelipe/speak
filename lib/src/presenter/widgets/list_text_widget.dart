import 'package:flutter/material.dart';
import 'package:speak/src/models/word_model.dart';

class ListTextWidget extends StatelessWidget {
  final List<WordModel> words;

  const ListTextWidget({Key? key, required this.words}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: words.map((WordModel wordModel) {
        return Text(
          wordModel.word,
          style: TextStyle(
            color: wordModel.isCorrect ? Colors.green : Colors.red,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.dotted,
            wordSpacing: .5,
          ),
        );
      }).toList(),
    );
  }
}
