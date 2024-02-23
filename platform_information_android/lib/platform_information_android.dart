import 'package:flutter/services.dart';
import 'package:platform_information_platform_interface/platform_information_platform_interface.dart';

/// The Android implementation of [PlatformInformationPlatform].
class PlatformInformationAndroid extends PlatformInformationPlatform {
  final methodChannel = const MethodChannel('platform_information_android');

  static void registerWith() {
    PlatformInformationPlatform.instance = PlatformInformationAndroid();
  }

  @override
  Future<String?> getPlatformInformation() {
    return methodChannel.invokeMethod('getPlatformInformation');
  }
}
