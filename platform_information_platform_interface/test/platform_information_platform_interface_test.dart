import 'package:flutter_test/flutter_test.dart';
import 'package:platform_information_platform_interface/platform_information_platform_interface.dart';

class PlatformInformationMock extends PlatformInformationPlatform {
  static const String _mockPlatformInformation = 'Mock platform information';

  @override
  Future<String?> getPlatformInformation() async {
    return _mockPlatformInformation;
  }
}

void main() {
  group('PlatformInformationPlatformInterface', () {
    late PlatformInformationPlatform platformInformationPlatform;
    setUp(() {
      platformInformationPlatform = PlatformInformationMock();
      PlatformInformationPlatform.instance = platformInformationPlatform;
    });

    test('get platform information', () async {
      expect(
          await PlatformInformationPlatform.instance.getPlatformInformation(),
          PlatformInformationMock._mockPlatformInformation);
    });
  });
}
