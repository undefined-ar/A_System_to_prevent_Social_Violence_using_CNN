import 'package:flutter_sms/flutter_sms.dart';

class CommonFunctions {
  static final _contactList = ["+8801947651802"];
  static Future<void> sendSms() async {
    try {
      String _result = await sendSMS(
        message: "HELP ME PLEASE",
        recipients: _contactList,
        sendDirect: true,
      );
    } catch (error) {
      print("FAILED TO SEND SMS");
    }
  }
}
