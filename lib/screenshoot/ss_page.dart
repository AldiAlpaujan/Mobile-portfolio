import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portofolio/screenshoot/controller.dart';

class SSPage extends StatelessWidget {
  final String name;
  final String category;
  const SSPage({Key? key, required this.name, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ScreenshootController());
    var _style = const TextStyle(color: Colors.white);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 9, 23, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInDown(
                  delay: _controller.duration,
                  child: Text(
                    name,
                    style: _style.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FadeInDown(
                  delay: _controller.getDelay(),
                  child: Text(
                    "$category Apps",
                    style: _style,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                  color: Colors.transparent,
                  child: FadeInDown(
                    delay: _controller.getDelay(),
                    child: CarouselSlider(
                      items: _controller.getItems(),
                      carouselController: _controller.carouselC,
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        aspectRatio: 0.5,
                        viewportFraction: 0.7,
                        onPageChanged: (index, reason) {
                          _controller.current.value = index;
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                FadeInDown(
                  delay: _controller.getDelay(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _controller.project
                        .asMap()
                        .entries
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              _controller.carouselC.animateToPage(e.key);
                            },
                            child: Obx(
                              () => Container(
                                width: 12.0,
                                height: 12.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.white
                                          : Colors.black)
                                      .withOpacity(
                                          _controller.current.value == e.key
                                              ? 0.9
                                              : 0.4),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                FadeInDown(
                  delay: _controller.getDelay(),
                  child: Center(
                    child: SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          _controller.duration =
                              const Duration(milliseconds: 300);
                          Get.back();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text("Portfolio"),
                            Icon(Icons.arrow_right)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
