import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/services.dart';
import 'package:platform_information_platform_interface/platform_information_platform_interface.dart';

/// The method channel implementation of [PlatformInformationPlatform].
class MethodChannelPlatformInformation extends PlatformInformationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('platform_information');

  @override
  Future<String?> getPlatformInformation() {
    return methodChannel.invokeMethod('getPlatformInformation');
  }
}
