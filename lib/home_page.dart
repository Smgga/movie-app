import 'package:flutter/material.dart';
import 'package:movie_app/pages/search_movies.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List search = [];
  String filme = '';
  final filmecontroller = TextEditingController();

  final String key = '02837fdf127570b399e05322fbb6523a';
  final String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMjgzN2ZkZjEyNzU3MGIzOTllMDUzMjJmYmI2NTIzYSIsInN1YiI6IjYyZGYzODcyZGMxY2I0MDA0ZmFjYjgxZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xwloTI_1JunykwOMyHpGbEffY9oAmttiLdGtRitiKl4';

  @override
  void initState() {
    super.initState();

    filmecontroller.addListener(() => setState(() {}));
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(key, token),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map searchresult = await tmdbWithCustomLogs.v3.search
        .queryMovies(filme, language: 'pt', region: 'BR');

    setState(() {
      search = searchresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
            title: const Center(
                child: Text('Movie App',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900))),
            backgroundColor: const Color.fromARGB(255, 45, 5, 94),
            elevation: 0),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: TextField(
                  controller: filmecontroller,
                  onChanged: (text) {
                    setState(() {
                      filme = text;
                      if (filmecontroller.text.isNotEmpty && filme[0] == ' ') {
                        // Anular empty e whitespace
                        filmecontroller.clear();
                      }
                      if (filmecontroller.text.isNotEmpty) {
                        loadmovies();
                      }
                    });
                  },
                  decoration: InputDecoration(
                      filled: false,
                      hintText: 'Procure Por um Filme',
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: Colors.deepPurple.shade900,
                      suffixIcon: filmecontroller.text.isEmpty
                          ? Container(width: 0)
                          : IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => filmecontroller.clear())),
                )),
            Flexible(
              child: Center(
                child: SizedBox(
                    width: 315,
                    height: MediaQuery.of(context).size.height,
                    child: SearchMovies(search: search)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
