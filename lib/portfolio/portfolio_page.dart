import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:portofolio/portfolio/controller.dart';
import 'package:portofolio/portfolio/widget.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(PortfolioController());
    final width = MediaQuery.of(context).size.width;
    var _sytle = const TextStyle(color: Colors.white);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 9, 23, 1),
      body: Stack(
        children: [
          Positioned(
            top: -120,
            left: 0,
            child: Opacity(
              opacity: 1,
              child: Container(
                width: width,
                height: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/one.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -150,
            left: 0,
            child: Container(
              width: width,
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/one.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: -180,
            left: 0,
            child: Container(
              width: width,
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/one.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    FadeInDown(
                      delay: _controller.duration,
                      child: Center(
                        child: Container(
                          width: 150,
                          height: 150,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.blue,
                          ),
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color.fromRGBO(3, 9, 23, 1),
                            ),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.blue,
                                image: const DecorationImage(
                                  //TODO: Mengganti FOto
                                  image: AssetImage('assets/images/foto.jpg'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    FadeInDown(
                      delay: _controller.getDelay(),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Aldi Alpaujan",
                              style: _sytle.copyWith(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Mobile developer",
                              style: _sytle.copyWith(color: Colors.grey[400]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    FadeInDown(
                      delay: _controller.getDelay(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => _controller.launchUrl(
                              //TODO: Link Untuk IG
                              "https://www.instagram.com/",
                            ),
                            icon: const Icon(FlutterRemix.instagram_line),
                            color: Colors.white,
                          ),
                          IconButton(
                            onPressed: () =>
                                //TODO: Link Untuk github
                                _controller.launchUrl("https://github.com/"),
                            icon: const Icon(FlutterRemix.github_line),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    FadeInDown(
                      delay: _controller.getDelay(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "3",
                                style: _sytle,
                              ),
                              Text(
                                "Completed\nProjects",
                                textAlign: TextAlign.center,
                                style: _sytle,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "2",
                                style: _sytle,
                              ),
                              Text(
                                "Satisfied\nCustomers",
                                textAlign: TextAlign.center,
                                style: _sytle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    FadeInDown(
                      delay: _controller.getDelay(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () => Get.back(),
                              child: const FittedBox(
                                  child: Text("Mengenai Aldi")),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[900],
                            ),
                            child: Stack(
                              children: [
                                const Center(
                                  child: Icon(
                                    FlutterRemix.whatsapp_line,
                                    color: Colors.white,
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    splashColor: Colors.white.withOpacity(0.1),
                                    onTap: () => _controller.launchUrl(
                                      //TODO: Link Untuk WA
                                      "https://wa.me/",
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[900],
                            ),
                            child: Stack(
                              children: [
                                const Center(
                                  child: Icon(
                                    FlutterRemix.telegram_line,
                                    color: Colors.white,
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    splashColor: Colors.white.withOpacity(0.1),
                                    onTap: () =>
                                        //TODO:Link Untuk Telegram
                                        _controller.launchUrl("https://t.me/"),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInDown(
                      delay: _controller.getDelay(),
                      child: Center(
                        child: Container(
                          width: 300,
                          height: 70,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[900],
                          ),
                          child: Row(
                            children: const [
                              Expanded(child: ButtonSkils(text: 'Projects')),
                              SizedBox(width: 8),
                              Expanded(child: ButtonSkils(text: 'Skils')),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => (_controller.isProject.value == true)
                          ? FadeInDown(
                              delay: _controller.durationSkils.value,
                              child: Column(
                                children: _controller.project
                                    .map(
                                      (e) => ProjectCard(
                                        img: e['img']!,
                                        category: e['category']!,
                                        name: e['name']!,
                                      ),
                                    )
                                    .toList(),
                              ),
                            )
                          : const SkilsCard(),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
