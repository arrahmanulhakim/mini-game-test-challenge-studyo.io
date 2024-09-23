import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_game_test_challenge/models/home_bindings.dart';
import 'package:mini_game_test_challenge/shared/app_audios.dart';

import 'screens/game_play_screen.dart';
import 'screens/main_menu_screen.dart';
import 'screens/sound_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mini Game Test Challenge',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(fontFamily: "Rubik"),
      initialBinding: HomeBinds(),
      home: MainMenuScreen(),
      getPages: [
        GetPage(name: "/home", page: () => MainMenuScreen()),
        GetPage(name: "/play", page: () => const GamePlayScreen()),
        GetPage(name: "/sound", page: () => const SoundScreen())
      ],
      onInit: () async {
        try {
          await FlameAudio.audioCache.loadAll([buttonClickSound]
            ..addAll(gameSounds.entries.map((e) => e.value).toList()));
        } catch (e) {
          print("Error : ${e.toString()}");
        }
      },
    );
  }
}
