import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portofolio/introduction/controller.dart';

class Bio extends StatelessWidget {
  final String year;
  final String data;
  const Bio({
    Key? key,
    required this.year,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Row(
        children: [
          Text(
            year,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            data,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonAnimation extends StatelessWidget {
  const ButtonAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(IntroduceController());
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "My portfolio",
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.arrow_right,
              color: Colors.white,
            )
          ],
        ),
        const SizedBox(height: 5),
        //button Animation
        Center(
          child: AnimatedBuilder(
            animation: _controller.scaleController,
            builder: (context, _) => Transform.scale(
              scale: _controller.scaleAnimation.value,
              child: AnimatedBuilder(
                animation: _controller.widthController,
                builder: (context, _) => FadeInUp(
                  child: Container(
                    width: _controller.widthAnimation.value,
                    height: 80,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue.withOpacity(.4),
                    ),
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            AnimatedBuilder(
                              animation: _controller.positionController,
                              builder: (context, _) => Positioned(
                                left: _controller.positionAnimation.value,
                                child: AnimatedBuilder(
                                  animation: _controller.scale2Controller,
                                  builder: (context, _) => Transform.scale(
                                    scale: _controller.scale2Animation.value,
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                      child: _controller.hideIcon.value
                                          ? Container()
                                          : const Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            _controller.scaleController.forward();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
