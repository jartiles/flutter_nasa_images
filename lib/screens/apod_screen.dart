import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//- Providers
import 'package:provider/provider.dart';
import 'package:flutter_nasa_images/services/nasa_services.dart';
//- Widgets
import 'package:flutter_nasa_images/widgets/widgets.dart';

class ApodScreen extends StatefulWidget {
  const ApodScreen({Key? key}) : super(key: key);

  @override
  State<ApodScreen> createState() => _ApodScreenState();
}

class _ApodScreenState extends State<ApodScreen> with KeepAliveParentDataMixin {
  @override
  Widget build(BuildContext context) {
    final nasaServices = Provider.of<NasaServices>(context);
    final apodList = nasaServices.apodList;
    return Scaffold(
      body: apodList.isEmpty && nasaServices.isLoading
          ? const IsLoading()
          : RefreshIndicator(
              child: ApodList(apodList: apodList),
              onRefresh: () => nasaServices.getApodImages(10),
            ),
    );
  }

  @override
  void detach() {
    // TODO: implement detach
  }

  @override
  bool get keptAlive => true;
}
