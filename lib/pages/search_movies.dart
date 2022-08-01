import 'package:flutter/material.dart';
import 'movie_info.dart';

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
            if (search[index]['overview'] != null &&
                search[index]['overview'] != '') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieInfo(
                          nome: search[index]['title'],
                          sinopse: search[index]['overview'],
                          capa: search[index]['backdrop_path'] != null
                              ? 'https://image.tmdb.org/t/p/w500${search[index]['backdrop_path']}'
                              : null,
                          poster:
                              'https://image.tmdb.org/t/p/w500${search[index]['poster_path']}',
                          rating: search[index]['vote_average'].toString(),
                          data: search[index]['release_date'])));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Color.fromARGB(255, 88, 43, 139),
                  content: Text(
                    'Este filme não tem sinopse',
                    style: TextStyle(color: Colors.white),
                  )));
            }
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
                                      'https://image.tmdb.org/t/p/w500${search[index]['poster_path']}'),
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
                                SizedBox(
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
                                      Text(search[index]['release_date'])
                                    ],
                                  ),

                                  //  color: Colors.green,
                                ),
                                Column(
                                  children: [
                                    Text(
                                        'Popularidade: ${search[index]['popularity']}'),
                                    const SizedBox(height: 5),
                                    Text(
                                        'Votos: ${search[index]['vote_count']}')
                                  ],
                                ),
                                Text('⭐ ${search[index]['vote_average']}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900))
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
