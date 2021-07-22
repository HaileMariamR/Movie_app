import 'package:flutter/material.dart';
import 'package:movie_app/utilities/constants.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Home",
          style: KappbarTextStyle,
        ),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Expanded(
              child: TextField(),
              flex: 1,
            ),
          ),
          Expanded(
              flex: 4,
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.h_mobiledata),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
