import 'package:flutter/material.dart';

class MovieInfo extends StatelessWidget {
  final String? nome, sinopse, capa, poster, rating, data;

  const MovieInfo({
    Key? key,
    this.nome,
    this.sinopse,
    this.capa,
    this.poster,
    this.rating,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Sinopse',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900)),
          backgroundColor: const Color.fromARGB(255, 45, 5, 94),
          elevation: 0),
      body: ListView(
        children: [
          capa != null
              ? SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    capa!,
                    fit: BoxFit.cover,
                  ))
              : Container(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flexible(
              child: Column(
                children: [
                  Text(nome!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w900)),
                  const SizedBox(height: 5),
                  sinopse != null
                      ? Text(sinopse!,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20))
                      : const Text('Sinopse em falta nos dados')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
