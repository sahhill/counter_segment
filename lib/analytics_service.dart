import 'dart:io';

import 'package:flutter_segment/flutter_segment.dart';
import 'package:mo_engage/segment_service.dart';

// ignore: constant_identifier_names
enum AnalyticsServiceType { Segment }

abstract class AnalyticsService {
  Future initService();
  Future logEvent(String eventName, [Map<String, dynamic>? parameters]);

  factory AnalyticsService(AnalyticsServiceType analyticsServiceType) {
    if (analyticsServiceType == AnalyticsServiceType.Segment) {
      return SegmentService();
    }
    return SegmentService();
  }
}
