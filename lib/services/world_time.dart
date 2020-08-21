import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // Location String for the UI
  String time; // Time string for the UI
  String flag; // Flag name for the UI
  String url; // Location url for API endpoint
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try{
      // Make the request
      Response response = await get("http://worldtimeapi.org/api/timezone/$url");

      Map data = jsonDecode(response.body);

      // Get properties from data

      String datetime = data["datetime"];

      String offset = data["utc_offset"].substring(0,3);
      

      // Create DateTime Object

      DateTime now = DateTime.parse(datetime);
      
      now = now.add(Duration(hours: int.parse(offset)));

      // Set the Time Property
      time = DateFormat.jm().format(now);

      isDayTime = (now.hour > 6 && now.hour <= 18) ? true : false;
    }
    catch (e){
      print("Caught Error: $e");
      time = "Could not Get Time Data";
      isDayTime = false;
    }
    

  }

}





