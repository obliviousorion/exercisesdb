class ExerciseApiUrls {
  static const String baseUrl = 'https://exercisedb.p.rapidapi.com';
  static const String bodyPart = '/exercises/bodyPart/';

  static String completeForBodypart(String local) {
    return baseUrl + bodyPart + local;
  }
}
