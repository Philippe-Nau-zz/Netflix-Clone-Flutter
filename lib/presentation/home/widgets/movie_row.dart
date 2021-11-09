import 'package:flutter/material.dart';
import 'package:netflix_clone/data/model/result_model.dart';
import 'package:netflix_clone/presentation/home/widgets/card_poster.dart';

class MovieRow extends StatelessWidget {
  final ResultModel result;
  const MovieRow({
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              result.slug ?? '',
              style: Theme.of(context).textTheme.headline3?.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  CardPoster(urlImage: result.results?[index].posterPath ?? ''),
              separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
