import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for ui
  String time; // time on that location
  String flag; // Url to assets flag icon
  String url; // location api url endpoint
  bool isDayTime; 

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      String offset2 = data['utc_offset'].substring(4, 6);

      DateTime dt = DateTime.parse(dateTime);
      dt = dt.add(Duration(hours: int.parse(offset), minutes: int.parse(offset2)));

      isDayTime = dt.hour > 6 && dt.hour < 12;
      time = DateFormat.jm().format(dt);

    } catch (e) {
      print("Error $e");
      time = "Error in Time";
    }
  }
}
