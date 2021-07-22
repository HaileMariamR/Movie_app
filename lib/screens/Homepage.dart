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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
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
            ),
            Expanded(
              flex: 4,
              child: ListView(
                children: [
                  MovieCardView(),
                  MovieCardView(),
                  MovieCardView(),
                  MovieCardView(),
                  MovieCardView(),
                  MovieCardView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieCardView extends StatelessWidget {
  const MovieCardView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black87,
      elevation: 4,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Image.network(
                'https://i.pinimg.com/236x/94/ec/e7/94ece7f1db85990fa144d79533c673bb.jpg',
                height: 150.0,
                width: 100.0,
                scale: 1,
              )),
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Movie title",
                      style: kMovieTitlestyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Subtitle",
                      style: kMovieTypeStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        width: 120.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "rating",
                            style: KmovieratingStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
