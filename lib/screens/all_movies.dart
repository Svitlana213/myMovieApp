import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/movie_list.dart';
import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}
class _MovieListState extends State<MovieList> {
  List<Movie> movies = [];
  List<Movie> search = [];
  @override
  void initState() {
    super.initState();
    showMovies();
  }
  Future<void> showMovies() async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/movie_data.json');
    List<dynamic> jsonList = json.decode(jsonString);
    setState(() {
      movies = jsonList.map((json) => Movie.fromJson(json)).toList();
      movies.sort((a,b) => b.imdbRating.compareTo(a.imdbRating));
      search = List.of(movies);
    });
  }
  void searchMovies(String query){
    setState(() {
      if(query.isEmpty){
        search = List.of(movies);
      }else{
        search = movies.where((movie) => movie.title.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Top Rated Movies'),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400),
          toolbarHeight: 75,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Padding(padding: EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) => searchMovies(value),
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Search movies',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: search.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(search[index].title, style: TextStyle(color: Colors.white),),
                      subtitle: Text(search[index].genre, style: TextStyle(color: Colors.white),),
                      leading: Image.network(search[index].poster),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetail(movie: search[index]),
                          ),
                        );
                      },
                    );
                  },
                ))
          ],
        )
    );
  }
}
