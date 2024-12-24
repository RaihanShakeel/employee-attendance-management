import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AttendancePageState();
  }
}

class _AttendancePageState extends State<AttendancePage> {

  late double _screenHeight, _screenWidth;
  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 3),
                blurRadius: 5
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _welcomeMessage(),
              _statusText(),
              _checkInAndCheckoutTime()
            ],
          ),
        ),
      ),
    );
  }

  Widget _welcomeMessage() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ListTile(
        title: Text(
          'Welcome',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade600),
        ),
        subtitle: Text(
          'Username',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
    );
  }

  Widget _statusText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(top: 20),
      child: Text(
        "Today's status",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey
        ),
      ),
    );
  }


  Widget _checkInAndCheckoutTime(){
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      width: _screenWidth,
      height: _screenHeight * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 5,
          )
        ],
        color: Colors.white
      ),
      child: Row(
        children: [

        ],
      ),
    );
  }
}
