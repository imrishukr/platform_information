import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_information_android/platform_information_android.dart';
import 'package:platform_information_platform_interface/platform_information_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('PlatformInfoAndroid', () {
    const kPlatformName = 'Android';
    late PlatformInformationAndroid platformInformation;
    late List<MethodCall> log;

    setUp(() async {
      platformInformation = PlatformInformationAndroid();
      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(platformInformation.methodChannel,
              (MethodCall methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformInformation':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      PlatformInformationAndroid.registerWith();
      expect(PlatformInformationPlatform.instance,
          isA<PlatformInformationAndroid>());
    });

    test('getPlatformInformation', () async {
      final result = await platformInformation.getPlatformInformation();
      expect(result, kPlatformName);
      expect(log, <Matcher>[
        isMethodCall('getPlatformInformation', arguments: null),
      ]);
    });
  });
}
