import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_bosta_fabrika/oyun_bosta_fabrika.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(bostaFabrikaConfig.title.length, 33);
    expect(bostaFabrikaConfig.tagline.length, 33);
    for (final s in bostaFabrikaConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(bostaFabrikaConfig.gameId, bostaFabrikaId);
    expect(bostaFabrikaRules.gameId, bostaFabrikaId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(bostaFabrikaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: bostaFabrikaId, optionalMechanics: bostaFabrikaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(bostaFabrikaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
