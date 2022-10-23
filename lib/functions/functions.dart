import 'package:twilio_flutter/twilio_flutter.dart';

class CommonFunctions {
  static final _contactList = ["+8801947651802"];
  static Future<void> sendSms(TwilioFlutter? twilioFlutter) async {
    try {
      await twilioFlutter?.sendSMS(
        toNumber: '+8801772961495',
        messageBody: 'help me plzz',
      );
    } catch (error) {
      print("FAILED TO SEND SMS");
    }
  }
}
