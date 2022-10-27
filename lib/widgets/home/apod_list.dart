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
    return PageView.builder(
      onPageChanged: (value) => nasaServices.setActualPage = value,
      scrollDirection: Axis.vertical,
      itemCount: apodList.length,
      itemBuilder: ((context, index) {
        return SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              _ApodImage(apodImage: apodList[index]),
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
    required this.apodImage,
  });

  final ApodModel apodImage;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height * .9,
      width: double.infinity,
      placeholder: const AssetImage('assets/loading.gif'),
      image: NetworkImage(
        apodImage.mediaType == 'video'
            ? apodImage.thumbnailUrl!
            : apodImage.url,
      ),
    );
  }
}
