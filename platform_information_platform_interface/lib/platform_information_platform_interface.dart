import 'package:platform_information_platform_interface/src/method_channel_platform_information.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of platform_information must implement.
abstract class PlatformInformationPlatform extends PlatformInterface {
  PlatformInformationPlatform() : super(token: _token);

  static final Object _token = Object();

  static PlatformInformationPlatform _instance =
      MethodChannelPlatformInformation();

  static PlatformInformationPlatform get instance => _instance;

  static set instance(PlatformInformationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns the platform information.
  Future<String?> getPlatformInformation();
}
