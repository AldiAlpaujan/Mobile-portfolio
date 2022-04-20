import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:portofolio/portfolio/controller.dart';
import 'package:portofolio/screenshoot/controller.dart';
import 'package:portofolio/screenshoot/ss_page.dart';

var _sytle = const TextStyle(color: Colors.white);
final _ssController = Get.put(ScreenshootController());
final _controller = Get.find<PortfolioController>();

class ButtonSkils extends StatelessWidget {
  final String text;
  const ButtonSkils({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (_controller.text.value == text)
              ? const Color.fromRGBO(3, 9, 23, 1)
              : Colors.transparent,
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                text,
                style: _sytle,
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                splashColor: Colors.white.withOpacity(0.1),
                onTap: () {
                  _controller.text.value = text;
                  _controller.isProject.value =
                      _controller.text.value == "Projects";
                  _controller.durationSkils.value =
                      const Duration(milliseconds: 100);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String img;
  final String category;
  final String name;

  const ProjectCard({
    Key? key,
    required this.img,
    required this.category,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: _sytle,
                    ),
                    Text(
                      name,
                      style: _sytle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: Stack(
                        children: [
                          const Center(
                            child: Icon(
                              FlutterRemix.link,
                              color: Colors.white,
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              splashColor: Colors.white.withOpacity(0.4),
                              onTap: () {
                                _ssController.duration =
                                    const Duration(milliseconds: 300);
                                switch (name) {
                                  case 'Daily Activity':
                                    _ssController.project = _controller.daily;
                                    break;
                                  case 'Portfolio Mobile':
                                    _ssController.project = _controller.pF;
                                    break;
                                  case "Fast Food App":
                                    _ssController.project = _controller.ff;
                                    break;
                                }
                                print(_ssController.project.length);
                                Get.to(
                                  SSPage(
                                    name: name,
                                    category: category,
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class RowSkils extends StatelessWidget {
  final String skils;
  final String cap;
  const RowSkils({
    Key? key,
    required this.skils,
    required this.cap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FlutterRemix.checkbox_circle_line,
          color: Colors.blue,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              skils,
              style: _sytle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              cap,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.grey[400]),
            ),
          ],
        )
      ],
    );
  }
}

class SkilsCard extends StatelessWidget {
  const SkilsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: _controller.durationSkils.value,
      child: Column(
        children: [
          //TODO:Skils yang di miliki
          Center(
            child: Text(
              "Teknologi Yang Dikuasai",
              style: _sytle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Expanded(
                child: RowSkils(
                  skils: "Flutter",
                  cap: "Intermediate",
                ),
              ),
              Expanded(
                child: RowSkils(
                  skils: "Dart",
                  cap: "Intermediate",
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Expanded(
                child: RowSkils(
                  skils: "Firebase",
                  cap: "Basic",
                ),
              ),
              Expanded(
                child: RowSkils(
                  skils: "Git",
                  cap: "Intermediate",
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              "Teknologi Yang Dipelajari",
              style: _sytle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Expanded(
                child: RowSkils(
                  skils: "Pascal",
                  cap: "Basic",
                ),
              ),
              Expanded(
                child: RowSkils(
                  skils: "C#",
                  cap: "Basic",
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Expanded(
                child: RowSkils(
                  skils: "MySQL",
                  cap: "Basic",
                ),
              ),
              Expanded(
                child: RowSkils(
                  skils: "Git",
                  cap: "Basic",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
