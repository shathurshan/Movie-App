import 'package:flutter/material.dart';
import 'package:movie_app/models/movies.dart';
import 'package:movie_app/services/api_manager.dart';
import 'package:movie_app/widgets/dashbord_card.dart';

class DashbordPage extends StatefulWidget {
  const DashbordPage({super.key});

  @override
  State<DashbordPage> createState() => _DashbordPageState();
}

class _DashbordPageState extends State<DashbordPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiManager().getMovies();
  }

  @override
  Widget build(BuildContext context) {
    var movies;
    return Scaffold(
      appBar: AppBar(
        title: const Text("MoviesHub"),
        centerTitle: true,
      ),
      body: FutureBuilder<Movies?>(
        future: ApiManager().getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data?.results.length,
            itemBuilder: (context, index) {
              Results? movies = snapshot.data?.results[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: DashbordCard(
                  movies: movies,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
