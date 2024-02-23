import 'package:platform_information_platform_interface/platform_information_platform_interface.dart';

PlatformInformationPlatform get _platformInformationPlatform =>
    PlatformInformationPlatform.instance;

/// Returns the platform information.
Future<String?> getPlatformInformation() async {
  final platformInformation =
      await _platformInformationPlatform.getPlatformInformation();
  if (platformInformation == null) {
    throw Exception('Unable to get platform information');
  }
  return platformInformation;
}
