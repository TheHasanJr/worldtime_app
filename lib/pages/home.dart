import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    

    String bgImage = data['isDayTime'] ? "day.jpg" : "night.jpg";
    Color textColor = data["isDayTime"] ? Colors.grey[800] : Colors.grey[300];

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('./assets/$bgImage'),
              fit: BoxFit.cover
              ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, "/location");
                    setState(() {
                      data = {
                        "time": result['time'],
                        "location": result['location'],
                        "isDayTime": result["isDayTime"],
                        "flag": result["flag"]
                      };
                    });
                  }, 
                  icon: Icon(
                    Icons.edit_location,
                    color: textColor,  
                  ),
                  label: Text(
                    "Edit Location",
                    style: TextStyle(
                      color: textColor,
                    )
                    ),
                ),
                SizedBox(height:20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage('./assets/${data["flag"]}'),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      data["location"],
                      style: TextStyle(
                        color: textColor,
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      
                      ),
                    ),
                  ]
                ),
                SizedBox(height:15.0),
                Text(
                  data["time"],
                  style: TextStyle(
                    color: textColor,
                    fontSize: 66.0,
                  ),  
                ),
              ]
            ),
          )

        ),
      );
    }
}