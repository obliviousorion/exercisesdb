class URLs {
  static const String serverUrl = "https://ps-1-data-nsq1.vercel.app";

  static String complete(String local) {
    return serverUrl + local;
  }
}
