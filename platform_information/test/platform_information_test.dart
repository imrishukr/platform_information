import 'package:flutter_test/flutter_test.dart';
import 'package:platform_information/platform_information.dart';
import 'package:platform_information_platform_interface/platform_information_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:mocktail/mocktail.dart';

class MockPlatformInformationPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements PlatformInformationPlatform {}

void main() {
  group('PlatformInformation', () {
    late PlatformInformationPlatform platformInformationPlatform;

    setUp(() {
      platformInformationPlatform = MockPlatformInformationPlatform();
      PlatformInformationPlatform.instance = platformInformationPlatform;
    });

    test('platform information', () async {
      const platformInformation = 'Test';
      when(() => platformInformationPlatform.getPlatformInformation())
          .thenAnswer((_) async => platformInformation);

      final actualPlatformInformation = await getPlatformInformation();
      expect(actualPlatformInformation, platformInformation);
    });

    test('platform information throws exception', () async {
      when(() => platformInformationPlatform.getPlatformInformation())
          .thenAnswer((_) async => null);

      expect(() async => await getPlatformInformation(), throwsException);
    });
  });
}
