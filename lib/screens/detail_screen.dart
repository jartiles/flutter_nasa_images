import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
//- Models
import 'package:flutter_nasa_images/models/apod_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApodModel arguments =
        ModalRoute.of(context)?.settings.arguments as ApodModel;
    const double padding = 20;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: false,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: FadeInImage(
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/loading.gif'),
                image: NetworkImage(
                  arguments.mediaType == 'video'
                      ? arguments.thumbnailUrl!
                      : arguments.url,
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: padding),
                  child: Text(
                    arguments.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 400),
                child: Text(
                  arguments.date,
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.center,
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 600),
                child: Padding(
                  padding: const EdgeInsets.all(padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        arguments.explanation,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        arguments.copyright ?? 'No copyright',
                        style: Theme.of(context).textTheme.caption,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
