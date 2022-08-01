Menu

leading: IconButton(
          //
          icon: const Icon(Icons.menu),
          tooltip: 'Menu',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Deseja ir para o Menu?')));
          },
        ),


Próxima Pagina

actions: [
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return Scaffold(
                    appBar: AppBar(
                      title: const Text('Sinopse'),
                    ),
                    body: const Center(
                      child: Text('blablabla'),
                    ));
              }));
            },
          )
        ],


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = HomeController.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Batman'),
      ),
      body: Center(
        child: Text('Movie Database ${controller.value}'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            controller.increment();
          }),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Batman'),
      ),
      body: Center(
        child: Text('Movie Database $counter'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              counter++;
            });
          }),
    );
  }
}



body: GridView.builder(
        itemCount: search.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.75),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieInfo(
                          nome: search[index]['title'],
                          sinopse: search[index]['overview'],
                          capa: 'https://image.tmdb.org/t/p/w500' +
                              search[index]['backdrop_path'],
                          poster: 'https://image.tmdb.org/t/p/w500' +
                              search[index]['poster_path'],
                          rating: search[index]['vote_average'].toString(),
                          data: search[index]['release_date'])));
            },
            child: search[index]['poster_path']!=null?Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    // ignore: prefer_interpolation_to_compose_strings
                    image: NetworkImage('https://image.tmdb.org/t/p/w500' +
                        search[index]['poster_path']),
                  ),
                ),
              ),
            ):Container(),
          );
        },
      ),










                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        // ignore: prefer_interpolation_to_compose_strings
                        image: NetworkImage('https://image.tmdb.org/t/p/w500' +
                            search![index]['poster_path']),
                      ),
                    ),
    






class SearchMovies extends StatelessWidget {
  final List search;
  final String? name;

  const SearchMovies({Key? key, required this.search, this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: search.length,
      itemBuilder: (context, index) {
        String name = search[index]['title'];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MovieInfo(
                        nome: search[index]['title'],
                        sinopse: search[index]['overview'],
                        // ignore: prefer_interpolation_to_compose_strings
                        capa: search[index]['backdrop_path'] != null
                            ? 'https://image.tmdb.org/t/p/w500' +
                                search[index]['backdrop_path']
                            : '',
                        // ignore: prefer_interpolation_to_compose_strings
                        poster: 'https://image.tmdb.org/t/p/w500' +
                            search[index]['poster_path'],
                        rating: search[index]['vote_average'].toString(),
                        data: search[index]['release_date'])));
          },
          child: search[index]['poster_path'] != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(71, 181, 126, 248),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  // ignore: prefer_interpolation_to_compose_strings
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          search[index]['poster_path']),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 150,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        search[index]['title'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                name.length > 20 ? 15 : 20,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(search[index]['release_date']
                                          .toString()
                                          .substring(0, 4)),
                                    ],
                                  ),

                                  //  color: Colors.green,
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Text(
                                          'Popularidade: ${search[index]['popularity']}'),
                                      const SizedBox(height: 5),
                                      Text(
                                          'Votos: ${search[index]['vote_count']}')
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Text(
                                      '⭐ ${search[index]['vote_average']}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
        );
      },
    );
  }
}
