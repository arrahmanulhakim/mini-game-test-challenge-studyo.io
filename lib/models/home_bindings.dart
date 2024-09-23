import 'package:get/get.dart';
import 'package:mini_game_test_challenge/models/settings_score.dart';

class HomeBinds implements Bindings {
  @override
  void dependencies() {
    Get.put<SettingsAndScoreModel>(SettingsAndScoreModel(), permanent: true);
  }
}
