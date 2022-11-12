import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class CommonFunctions {
  static final _contactList = [""];
  static Future<void> sendSms({TwilioFlutter? twilioFlutter, Position? position}) async {
    try {
      await twilioFlutter?.sendSMS(
        toNumber: '',
        messageBody: 'help me plzz https://www.google.com/maps/search/?api=1&query=${position?.latitude},${position?.longitude}',
      );
      log("POSITION ${position?.latitude} ${position?.longitude}");
    } catch (error) {
      print("FAILED TO SEND SMS");
    }
  }
}
