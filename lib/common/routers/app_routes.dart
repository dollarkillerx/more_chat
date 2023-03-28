class AppRoutes {
  static const String Home = '/home';
  static const String Subscription = '/subscription';
  static const String SubscriptionNodes = '/subscription/nodes';

  static const String NotFound = '/unknown';

  static String pathJoin(List<String> paths) {
    return paths.join("");
  }
}

