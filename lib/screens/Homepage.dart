import 'package:flutter/material.dart';
import 'package:movie_app/utilities/constants.dart';
import '../services/Networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/appstate/AppState.dart';


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

  String? movieImageUrl = "";
  String? movieTitle = "";
  String? movieType = "";
  String? Rating = "";
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

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
                        appState.getMoviesFromApi(myController.text);
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
                child: (appState.isFatching)
                    ? SpinKitRing(
                        color: Colors.black,
                        size: 50,
                      )
                    : ListView(
                        children: appState.getAllMovies
                            .map((movie) => Card(
                                  shadowColor: Colors.black87,
                                  elevation: 4,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Image.network(
                                            '${movie['image']}',
                                            height: 150.0,
                                            width: 100.0,
                                            scale: 1,
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${movie['title']}",
                                                  style: kMovieTitlestyle,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "${movie['description']}",
                                                  style: kMovieTypeStyle,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                                  child: Container(
                                                    width: 120.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "${movie["imDb"]} IMDB",
                                                        style:
                                                            KmovieratingStyle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                ))
                            .toList()))
          ],
        ),
      ),
    );
  }
}
