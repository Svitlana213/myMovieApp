import 'package:flutter/material.dart';

import '../model/movie_list.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  MovieDetail({required this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(movie.title),
        toolbarHeight: 100,
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Displaying images using ListView.builder
            SizedBox(
              height: 200, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movie.images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      movie.images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Genre: ${movie.genre}', style: TextStyle(color: Colors.white),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Runtime: ${movie.runtime}', style: TextStyle(color: Colors.white),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Actors: ${movie.actors}', style: TextStyle(color: Colors.white),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Year: ${movie.year}', style: TextStyle(color: Colors.white),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Country: ${movie.country}', style: TextStyle(color: Colors.white),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('IMDB rating: ${movie.imdbRating}', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}