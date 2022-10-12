import 'package:flutter/material.dart';

class IsLoading extends StatefulWidget {
  const IsLoading({Key? key}) : super(key: key);

  @override
  State<IsLoading> createState() => _IsLoadingState();
}

class _IsLoadingState extends State<IsLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: _animation,
            child: const Icon(
              Icons.rocket_launch,
              color: Colors.blueAccent,
              size: 100,
            ),
          ),
          const Text(
            'Cargando...',
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
