import 'dart:convert';

import 'package:flutter/material.dart';

import 'abstract_simple_params.dart';

class SimpleParameters extends AbstractSimpleParameters {
  @protected
  Map<String, String> headers = {
    'X-Rapidapi-Key': '7195cc1991msh24527d057955726p171039jsn7dab2fdd40a7',
    'X-Rapidapi-Host': 'exercisedb.p.rapidapi.com',
    'Host': 'exercisedb.p.rapidapi.com',
  };
  @protected
  Map<String, dynamic> body = {};
  @protected
  Map<String, String> queryParams = {};
  @protected
  Map<String, String> files = {};
//  @protected
//  String? suburl;
  @protected
  String? paginatedOverridenUrl;

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
    if (paginatedOverridenUrl != null) {
      return paginatedOverridenUrl!;
    }

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
