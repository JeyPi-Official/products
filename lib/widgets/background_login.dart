import 'package:flutter/material.dart';

class BackgroundLogin extends StatelessWidget {

  final Widget child;

  const BackgroundLogin({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PurpleBox(),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 60),
            child: const Icon(Icons.person_pin, color: Colors.white, size: 100,),
          ),
          child,
        ],
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  // const _PurpleBox({super.key});

  @override
  Widget build(BuildContext context) {
    //get screen size using mediaquery
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.yellow,
          Colors.orange,
          Colors.red,
          Colors.purple,
        ], begin: Alignment.bottomLeft),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 60,
            left: 30,
            child: _Sphere(),
          ),
          Positioned(
            top: 100,
            left: 80,
            child: _Sphere(),
          ),
          Positioned(
            top: 200,
            left: 190,
            child: _Sphere(),
          ),
          Positioned(
            top: 150,
            left: 240,
            child: _Sphere(),
          )
        ],
      ),
    );
  }
}

class _Sphere extends StatelessWidget {
  // const _Sphere({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.15)),
    );
  }
}
