import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../enums/score_types.dart';
import '../game.dart';
import '../shared/game_colors.dart';

class ScoreComponent extends TextComponent
    with HasGameRef<MiniGameTestChallenge> {
  final ScoreType scoreType;
  ScoreComponent({
    required Vector2 position,
    required this.scoreType,
  }) : super(position: position, anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    this.text =
        "${scoreType == ScoreType.MaxTile ? "Max" : "Score"} ${scoreType == ScoreType.MaxTile ? "Max" : "Score"}?gameRef.gameModel.currentScore:gameRef.gameModel.currentScore}";
    this.textRenderer = TextPaint(
        style: TextStyle(
            color: appTextColor1,
            fontSize: gameRef.size.x * .08,
            fontWeight: FontWeight.bold,
            fontFamily: "Rubik"));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    this.text =
        "${scoreType == ScoreType.MaxTile ? "Max" : "Score"} : ${scoreType == ScoreType.MaxTile ? gameRef.gameModel.currentMaxTileValue : gameRef.gameModel.currentScore}";
  }
}
