import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/models/movies.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:movie_app/ui/detail_page.dart';

class DashbordCard extends StatelessWidget {
  Results? movies;
  DashbordCard({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (movies != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                movieResults: movies,
              ),
            ),
          );
        } else {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      child: Container(
        height: ScreenUtil().setHeight(140),
        width: ScreenUtil().setWidth(70),
        decoration: const BoxDecoration(
          color: Color(0xff666666),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              height: ScreenUtil().setHeight(120),
              width: ScreenUtil().setWidth(100),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/original${movies?.posterPath}"),
                  fit: BoxFit.fill,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: ScreenUtil().setWidth(220),
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10.0,
                    ),
                    child: AutoSizeText(
                      movies?.title ?? "No Data",
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(200),
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 10,
                      right: 10.0,
                    ),
                    child: AutoSizeText(
                      movies?.overview ?? "No Data",
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 10,
                      right: 10.0,
                    ),
                    child: Text(
                      movies?.releaseDate ?? "No Data",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(18),
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
