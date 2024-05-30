import 'package:exercisesdb2/exercise_api/exercise_api_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bodyPartProvider = StateProvider<String>((ref) => '');
final exerciseModelProvider = StateProvider<ExerciseModel>((ref) {
  return ExerciseModel(
      bodyPart: '',
      equipment: '',
      gifUrl: '',
      id: '',
      name: '',
      target: '',
      secondaryMuscles: [],
      instructions: []);
});
