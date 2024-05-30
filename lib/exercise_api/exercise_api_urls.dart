class ExerciseApiUrls {
  static const String baseUrl = 'https://exercisedb.p.rapidapi.com';

  static String complete(String local) {
    return baseUrl + local;
  }
}
