import 'package:flutter/material.dart';

class LandingBackground extends StatelessWidget {
  const LandingBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .75,
      width: double.infinity,
      child: Stack(
        children: const [
          //- Planets
          Positioned(
            bottom: 40,
            left: 40,
            child: _AnimatedPlanet(image: 'assets/planet_blue.png'),
          ),
          Positioned(
            bottom: 200,
            left: 40,
            child: _AnimatedPlanet(image: 'assets/small_planet_pink.png'),
          ),
          Positioned(
            bottom: 50,
            right: 10,
            child: _AnimatedPlanet(image: 'assets/planet_purple.png'),
          ),
          Positioned(
            top: 100,
            right: 10,
            child: _AnimatedPlanet(image: 'assets/pink_saturn.png'),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: _AnimatedPlanet(image: 'assets/planet_pink.png'),
          ),
          Positioned(
            top: 250,
            right: 30,
            child: _AnimatedPlanet(image: 'assets/purple_saturn.png'),
          ),
          _Astronaut(),
        ],
      ),
    );
  }
}

class _Astronaut extends StatelessWidget {
  const _Astronaut({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: Image(
        image: AssetImage('assets/astronaut_alone.png'),
        height: 100,
      ),
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
