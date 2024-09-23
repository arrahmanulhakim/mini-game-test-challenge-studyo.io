import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../game.dart';

MiniGameTestChallenge _miniGame = MiniGameTestChallenge(rows: 4, cols: 4);

class GamePlayScreen extends StatelessWidget {
  const GamePlayScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
          onWillPop: () async {
            await Get.offNamed("/home");
            return true;
          },
          child: GameWidget(game: _miniGame)),
    );
  }
}
