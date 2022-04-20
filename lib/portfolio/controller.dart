import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

class PortfolioController extends GetxController
    with GetTickerProviderStateMixin {
  var text = "Projects".obs;
  var isProject = true.obs;
  var hideIcon = false.obs;
  var duration = const Duration(milliseconds: 300);
  var durationSkils = const Duration(milliseconds: 900).obs;

  List<Map<String, dynamic>> project = [
    {
      "img": "assets/images/project1.jpg",
      "category": "Mobile",
      "name": "Daily Activity",
    },
    {
      "img": "assets/images/project2.jpg",
      "category": "Mobile",
      "name": "Portfolio Mobile",
    },
    {
      "img": "assets/images/project3.jpg",
      "category": "Mobile",
      "name": "Fast Food App",
    }
  ];
  List<String> daily = const [
    //TODO:"AssetsImage"
    "",
    "",
    ""
  ];
  List<String> ff = const [
    //TODO:"AssetsImage"
    "",
    "",
    ""
  ];

  List<String> pF = [
    //TODO:"AssetsImage"
    "",
    "",
    ""
  ];
  //TODO: Bisa juga di tambahkan jika ingin menambahkan screenshoot

  Duration getDelay() {
    duration += const Duration(milliseconds: 100);
    return duration;
  }

  launchUrl(String url) async {
    await launch(url);
  }
}
