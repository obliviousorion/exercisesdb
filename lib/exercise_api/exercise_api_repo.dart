// import 'dart:convert';
import 'package:exercisesdb2/logic/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'exercise_api_model.dart';
import 'exercise_api_params.dart';
import '../utils/api/core/http_method.dart';
import '../utils/api/implementation/riverpod_api/riverpod_api.dart';
import 'exercise_api_urls.dart';
import '../utils/factory_utils.dart';

part 'exercise_api_repo.g.dart';

@Riverpod(keepAlive: true)
RiverpodAPI<List<ExerciseModel>, ExerciseApiParams> exerciseRepo(
    ExerciseRepoRef ref) {
  return RiverpodAPI<List<ExerciseModel>, ExerciseApiParams>(
    completeUrl: ExerciseApiUrls.complete("${ref.watch(bodyPartProvider)}"),
    factory: FactoryUtils.listFromString(ExerciseModel.fromJson),
    params: ExerciseApiParams(),
    method: HTTPMethod.get,
    ref: ref,
  );
}
