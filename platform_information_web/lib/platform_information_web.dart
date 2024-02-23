import 'package:platform_information_platform_interface/platform_information_platform_interface.dart';

/// The web implementation of [PlatformInformationPlatform].
class PlatformInformationWeb extends PlatformInformationPlatform {
  /// Registers this class as the default instance of [PlatformInformationPlatform].
  static void registerWith([Object? registrar]) {
    PlatformInformationPlatform.instance = PlatformInformationWeb();
  }

  @override
  Future<String?> getPlatformInformation() async => 'Web';
}
