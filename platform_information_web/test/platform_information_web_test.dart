import 'package:flutter_test/flutter_test.dart';
import 'package:platform_information_platform_interface/platform_information_platform_interface.dart';
import 'package:platform_information_web/platform_information_web.dart';

void main() {
  group('PlatformInformationWeb', () {
    const kPlatformInformationWeb = 'Web';
    late PlatformInformationWeb platformInformationWeb;

    setUp(() async {
      platformInformationWeb = PlatformInformationWeb();
    });

    test('can be registered', () {
      PlatformInformationWeb.registerWith();
      expect(
        PlatformInformationPlatform.instance,
        isA<PlatformInformationWeb>(),
      );
    });

    test('getPlatformInformation', () async {
      final platformInfomation =
          await platformInformationWeb.getPlatformInformation();
      expect(
        platformInfomation,
        kPlatformInformationWeb,
      );
    });
  });
}
