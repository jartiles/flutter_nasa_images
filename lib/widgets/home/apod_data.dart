import 'dart:math';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import 'package:flutter_nasa_images/models/apod_model.dart';
import 'package:flutter_nasa_images/themes/custom_theme.dart';

class ApodData extends StatelessWidget {
  const ApodData({Key? key, required this.apodData}) : super(key: key);

  final ApodModel apodData;

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;
    double sizeContainer;

    if (maxHeight > 500) {
      sizeContainer = maxHeight * 0.4;
    } else {
      sizeContainer = maxHeight * 0.6;
    }

    return Container(
      decoration: _boxDecoration(),
      height: sizeContainer,
      width: maxWidth,
      padding: const EdgeInsets.all(30),
      child: _TitleAndData(apodData: apodData),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      gradient: CustomTheme().apodContainerGradient,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(160),
      ),
    );
  }
}

class _TitleAndData extends StatelessWidget {
  const _TitleAndData({Key? key, required this.apodData}) : super(key: key);

  final ApodModel apodData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      child: FadeInUp(
        duration: const Duration(seconds: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              apodData.date,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              apodData.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 25),
            ),
            Text(
              apodData.explanation,
              maxLines: 3,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
            ),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/detail',
                    arguments: apodData),
                child: const Text('Show me more'))
          ],
        ),
      ),
    );
  }
}
