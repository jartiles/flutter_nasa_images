import 'package:flutter/material.dart';
import 'package:flutter_nasa_images/models/apod_model.dart';
import 'package:flutter_nasa_images/widgets/widgets.dart';
//- Provider
import 'package:provider/provider.dart';
import '../../services/nasa_services.dart';

class ApodList extends StatelessWidget {
  const ApodList({Key? key, required this.apodList}) : super(key: key);

  final List<ApodModel> apodList;

  @override
  Widget build(BuildContext context) {
    final nasaServices = Provider.of<NasaServices>(context);
    final double maxHeight = MediaQuery.of(context).size.height;
    return PageView.builder(
      onPageChanged: (value) => nasaServices.setActualPage = value,
      scrollDirection: Axis.vertical,
      itemCount: apodList.length,
      itemBuilder: ((context, index) {
        return SizedBox(
          height: maxHeight,
          child: Stack(
            children: [
              _ApodImage(maxHeight: maxHeight, apodImage: apodList[index]),
              Positioned(
                bottom: 0,
                child: ApodData(apodData: apodList[index]),
              )
            ],
          ),
        );
      }),
    );
  }
}

class _ApodImage extends StatelessWidget {
  const _ApodImage({
    Key? key,
    required double maxHeight,
    required this.apodImage,
  })  : _maxHeight = maxHeight,
        super(key: key);

  final double _maxHeight;
  final ApodModel apodImage;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: apodImage.title,
      child: FadeInImage(
        fit: BoxFit.cover,
        height: _maxHeight * 0.9,
        width: double.infinity,
        placeholder: const AssetImage('assets/loading.gif'),
        image: NetworkImage(
          apodImage.mediaType == 'video'
              ? apodImage.thumbnailUrl!
              : apodImage.url,
        ),
      ),
    );
  }
}
