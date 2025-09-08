/// Route paths constants for the application
class RoutePaths {
  // Private constructor to prevent instantiation
  RoutePaths._();

  // Base paths
  static const String splash = '/';
  static const String home = '/home';
  static const String counter = '/counter';
  static const String auth = '/auth';
  
  // Auth specific paths
  static const String signIn = '/auth/sign-in';
  static const String signUp = '/auth/sign-up';
  static const String forgotPassword = '/auth/forgot-password';
  
  // Counter specific paths
  static const String counterDetail = '/counter/detail';
}
