import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:portofolio/const.dart';
import 'package:portofolio/introduction/controller.dart';
import 'package:portofolio/introduction/widget.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final _controller = Get.put(IntroduceController());

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
                height: 500,
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
                    Obx(
                      () => (_controller.hide.value)
                          ? Container(
                              height: 500,
                              color: Colors.transparent,
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeInDown(
                                  delay: _controller.duration,
                                  child: Center(
                                    child: SizedBox(
                                      width: 150,
                                      height: 150,
                                      child: Lottie.asset(
                                          'assets/lottie/programming.json',
                                          reverse: true),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                FadeInDown(
                                  delay: _controller.getDelay(),
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[700],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        //TODO:Pengenalan pertama
                                        "Hallo, Saya junior Mobile developer hidup di kota Kuningan",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FadeInDown(
                                          delay: _controller.getDelay(),
                                          child: const Text(
                                            //TODO:bisa diganti dengan nama sendiri
                                            "Hendri Hendrawan",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        FadeInDown(
                                          delay: _controller.getDelay(),
                                          child: const Text(
                                            "Junior Programmer \n(Mobile Developer)",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    FadeInDown(
                                      delay: _controller.getDelay(),
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.blue,
                                        ),
                                        child: Container(
                                          width: 80,
                                          height: 80,
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color.fromRGBO(
                                                3, 9, 23, 1),
                                          ),
                                          child: Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.blue,
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    //TODO:Mengganti foto
                                                    'assets/images/foto.jpg'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                FadeInDown(
                                  delay: _controller.getDelay(),
                                  child: const Text(
                                    "Work",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                FadeInDown(
                                  delay: _controller.getDelay(),
                                  child: Container(
                                    width: 60,
                                    height: 5,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                FadeInDown(
                                  delay: _controller.getDelay(),
                                  child: Container(
                                    width: double.infinity,
                                    height: 90,
                                    color: Colors.transparent,
                                    child: Text(
                                      work,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    FadeInDown(
                        delay: _controller.getDelay(),
                        child: const ButtonAnimation()),
                    Obx(
                      () => (_controller.hideIcon.value)
                          ? Container(
                              height: 200,
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeInDown(
                                  delay: _controller.getDelay(),
                                  child: const Text(
                                    "Bio",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                FadeInDown(
                                  delay: _controller.getDelay(),
                                  child: Container(
                                    width: 40,
                                    height: 5,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                //TODO:Mengganti BI0
                                const SizedBox(height: 10),
                                FadeInDown(
                                  delay: _controller.getDelay(),
                                  child: const Bio(
                                    year: "2004",
                                    data: "Lahir di Kuningan jawa barat",
                                  ),
                                ),
                                FadeInDown(
                                  delay: _controller.getDelay(),
                                  child: const Bio(
                                    year: "2020",
                                    data: "Keluar MTS/Smp",
                                  ),
                                ),
                                FadeInDown(
                                  delay: _controller.getDelay(),
                                  child: const Bio(
                                    year: "2022",
                                    data: "SMK + freelancer",
                                  ),
                                ),
                                const SizedBox(height: 10),
                                FadeInDown(
                                  delay: _controller.getDelay(),
                                  child: const Text(
                                    "I Love",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                FadeInDown(
                                  delay: _controller.getDelay(),
                                  child: Container(
                                    width: 80,
                                    height: 5,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                //TODO:Mengganti apa yang disukai
                                FadeInDown(
                                  delay: _controller.getDelay(),
                                  child: const Text(
                                    "       Playing Game,read book, Music,",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
