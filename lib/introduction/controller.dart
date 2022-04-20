import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:portofolio/portfolio/controller.dart';
import 'package:portofolio/portfolio/portfolio_page.dart';
import 'package:portofolio/screenshoot/controller.dart';

class IntroduceController extends GetxController
    with GetTickerProviderStateMixin {
  var hideIcon = false.obs;
  var hide = false.obs;
  var duration = const Duration(milliseconds: 200);
  final _pFController = Get.put(PortfolioController());
  final _ssController = Get.put(ScreenshootController());

  Duration getDelay() {
    duration += const Duration(milliseconds: 50);
    return duration;
  }

  //scaleAnimation
  late AnimationController scaleController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );
  late Animation scaleAnimation =
      Tween<double>(begin: 1.0, end: 0.8).animate(scaleController)
        ..addStatusListener(
          (status) {
            if (status == AnimationStatus.completed) {
              widthController.forward();
            }
          },
        );

  //width Animation
  late AnimationController widthController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  );
  late Animation widthAnimation =
      Tween<double>(begin: 80.0, end: 300.0).animate(widthController)
        ..addStatusListener(
          (status) {
            if (status == AnimationStatus.completed) {
              positionController.forward();
            } else if (status == AnimationStatus.dismissed) {
              scaleController.reverse();
            }
          },
        );

  //position Animation
  late AnimationController positionController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  );
  late Animation positionAnimation = Tween<double>(
    begin: 0.0,
    end: 220.0,
  ).animate(positionController)
    ..addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          hideIcon.value = true;
          _ssController.project = [];
          scale2Controller.forward();
        }
      },
    );

  //scale2 Animation
  late AnimationController scale2Controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );
  late Animation scale2Animation = Tween<double>(begin: 1.0, end: 32.0)
      .animate(scale2Controller)
    ..addStatusListener(
      (status) async {
        if (status == AnimationStatus.completed) {
          hide.value = true;
          duration = const Duration(milliseconds: 200);
          await Get.to(const Portfolio());
          hide.value = false;
          scale2Controller.reverse();
          _pFController.text.value = "Projects";
          _pFController.isProject.value = true;
          _pFController.duration = duration = const Duration(milliseconds: 300);
          _pFController.durationSkils.value = const Duration(milliseconds: 900);
        } else if (status == AnimationStatus.dismissed) {
          hideIcon.value = false;
          widthController.reverse();
          positionController.reverse();
        }
      },
    );

  @override
  void dispose() {
    scaleController.dispose();
    scale2Controller.dispose();
    widthController.dispose();
    positionController.dispose();
    super.dispose();
  }
}
