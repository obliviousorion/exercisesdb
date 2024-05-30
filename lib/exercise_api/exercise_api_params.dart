import 'package:exercisesdb2/utils/api/implementation/simple_api/abstract_simple_params.dart';
import 'dart:convert';

class ExerciseApiParams extends AbstractSimpleParameters {
  @override
  Map<String, String> headers = {
    'X-Rapidapi-Key': '7195cc1991msh24527d057955726p171039jsn7dab2fdd40a7',
    'X-Rapidapi-Host': 'exercisedb.p.rapidapi.com',
    'Host': 'exercisedb.p.rapidapi.com',
  };
  
  @override
  Map<String, dynamic> body = {};
  @override
  Map<String, String> queryParams = {};
  @override
  Map<String, String> files = {};

  @override
  String getBodyEncoded() {
    return jsonEncode(body);
  }

  @override
  Map<String, String> getHeaders() {
    return <String, String>{}..addAll(headers);
  }

  @override
  String getFormattedUrl(String raw) {
    if (queryParams.isNotEmpty) {
      String res = "$raw?";
      queryParams.forEach((key, value) {
        res += "$key=$value&";
      });
      return res;
    } else {
      return raw;
    }
  }

  @override
  String? get overriddenUrl => null;

  @override
  void reset() {
    headers = {};
    body = {};
    queryParams = {};
  }

  @override
  Map<String, dynamic> getBodyUnencoded() {
    return body;
  }

  @override
  Map<String, String> getFiles() {
    return files;
  }
}
