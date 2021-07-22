import 'package:flutter/material.dart';
import 'package:movie_app/utilities/constants.dart';
import '../services/Networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final String apikey = "k_zs214rb2";

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
  List results = [];
  List<String> imDb = [];
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
                      onTap: () async {
                        print(myController.text);
                        var moviedata = GetMovieDta(
                            url:
                                "https://imdb-api.com/en/API/SearchMovie/k_qn7996fq/${myController.text}");
                        await moviedata.getData().then((value) {
                          setState(() {
                            results = value['results'];
                          });
                        });

                        for (var item in results) {
                          var getrating = GetMovieDta(
                              url:
                                  "https://imdb-api.com/en/API/Ratings/k_qn7996fq/${item['id']}");
                          await getrating.getData().then((value) {
                            setState(() {
                              imDb.add(value['imDb'].toString());
                            });
                          });
                        }
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
                child: (results.length == 0)
                    ? SpinKitRing(
                        color: Colors.black,
                        size: 50,
                      )
                    : ListView(children: allMovies(results.length)))
          ],
        ),
      ),
    );
  }

  List<Widget> allMovies(int numberofmovies) {
    List<Widget> allmovies = [];

    int i = 0;

    while (i < numberofmovies) {
      Card movie = Card(
        shadowColor: Colors.black87,
        elevation: 4,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Image.network(
                  '${results[i]['image']}',
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
                        "${results[i]['title']}",
                        style: kMovieTitlestyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${results[i]['description']}",
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
                              "${imDb[i]} IMDB",
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
      i++;
      allmovies.add(movie);
    }

    return allmovies;
  }
}
