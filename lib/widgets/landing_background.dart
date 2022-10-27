import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingBackground extends StatelessWidget {
  const LandingBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double maxWidthPercen = screenWidth > 500 ? .7 : 0.9;
    double centerPlanet;
    if (screenHeight < 300) {
      centerPlanet = screenHeight * .3;
    } else {
      centerPlanet = screenHeight * .1;
    }
    return SizedBox(
      height: screenHeight * .6,
      width: screenWidth * maxWidthPercen,
      child: Stack(
        children: [
          //- Left Planets
          const Positioned(
            top: 0,
            left: 40,
            child: _AnimatedPlanet(image: 'assets/small_planet_pink.png'),
          ),
          Positioned(
            top: centerPlanet,
            left: 10,
            child: const _AnimatedPlanet(image: 'assets/planet_pink.png'),
          ),
          const Positioned(
            bottom: 0,
            left: 40,
            child: _AnimatedPlanet(image: 'assets/planet_blue.png'),
          ),
          //- Right Planets
          const Positioned(
            top: 10,
            right: 10,
            child: _AnimatedPlanet(image: 'assets/pink_saturn.png'),
          ),
          Positioned(
            bottom: centerPlanet,
            right: 10,
            child: const _AnimatedPlanet(image: 'assets/planet_purple.png'),
          ),
          const Positioned(
            bottom: 10,
            right: 30,
            child: _AnimatedPlanet(image: 'assets/purple_saturn.png'),
          ),
          const _Astronaut()
        ],
      ),
    );
  }
}

class _Astronaut extends StatelessWidget {
  const _Astronaut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(
      'https://www.freepik.es/vector-gratis/fondo-dibujado-colorido-espacio_4792328.htm#query=space&position=3&from_view=search',
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: const AssetImage('assets/astronaut_alone.png'),
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height * .4,
        ),
        const SizedBox(height: 20, width: double.infinity),
        TextButton(
          onPressed: () async {
            if (!await canLaunchUrl(url)) return;
            await launchUrl(url);
          },
          child: const Text(
            'Image from pikisuperstar Freepik',
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

class _AnimatedPlanet extends StatefulWidget {
  const _AnimatedPlanet({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  State<_AnimatedPlanet> createState() => _AnimatedPlanetState();
}

class _AnimatedPlanetState extends State<_AnimatedPlanet>
    with SingleTickerProviderStateMixin {
  //- Animation controller use for set duration and control de animation
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  //- Animation use for se position of animation
  //- Tween is used to set the start and end values of the animation.
  late final Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: const Offset(0, 0.1),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //- Floating animation
    return SlideTransition(
      position: _animation,
      child: Image(image: AssetImage(widget.image)),
    );
  }
}
