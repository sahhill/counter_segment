import 'dart:io';

import 'package:flutter_segment/flutter_segment.dart';

import 'analytics_service.dart';

class SegmentService implements AnalyticsService {
  static SegmentService? _instance;

  SegmentService._internal();

  factory SegmentService() => _instance ??= SegmentService._internal();

  @override
  Future initService() async {
    late String writeKey;
    if (Platform.isAndroid) {
      writeKey = "eKOFXo3q6xuaH2VzwwtyGs1QSi4rf117";
    } else {
      //iOS
      writeKey = "IOS_WRITE_KEY";
    }
    await Segment.config(
      options: SegmentConfig(
        writeKey: writeKey,
        trackApplicationLifecycleEvents: false,
        amplitudeIntegrationEnabled: false,
        debug: false,
      ),
    );
  }

  @override
  Future logEvent(String eventName, [Map<String, dynamic>? parameters]) {
    return Segment.track(eventName: eventName, properties: parameters);
  }
}
