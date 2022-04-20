import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenshootController extends GetxController {
  var current = 0.obs;
  CarouselController carouselC = CarouselController();

  List<String> project = [];

  var duration = const Duration(milliseconds: 300);
  Duration getDelay() {
    duration += const Duration(milliseconds: 100);
    return duration;
  }

  List<Widget> getItems() {
    List<Widget> card = project
        .map((e) => Container(
            color: Colors.transparent,
            child: Container(
              color: Colors.white,
            )))
        .toList();
    return card;
  }
}
