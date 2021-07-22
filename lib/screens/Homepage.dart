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
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Expanded(
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        print(myController.text);
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    hintText: "Search for movies"),
              ),
              flex: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Expanded(
                flex: 4,
                child: ListView(
                  children: [
                    Expanded(
                        child: Container(
                      child: Row(
                        children: [
                          
                          
                        ],
                      ),
                    ))
                  ],
                )),
          )
        ],
      ),
    );
  }
}
