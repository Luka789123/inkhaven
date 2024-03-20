import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingRoute extends StatelessWidget {
  const LandingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _BottomNavigationBar(
        onTap: (int index) {},
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({super.key, required this.onTap});
  final Function(int index) onTap;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final Tween<double> _indicatorTween = Tween<double>(begin: 0, end: 1);
  late final Animation<double> _animation;
  int _index = 0;
  int _previusIndex = 0;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 250,
        ),
        reverseDuration: const Duration(milliseconds: 250));
    _animation = _animationController
        .drive(_indicatorTween.chain(CurveTween(curve: Curves.easeInCirc)));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _changeIndex(int index) async {
    _index = index;

    await _animationController
        .forward()
        .then((value) => _animationController.reset());
    widget.onTap(_index);
    _previusIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          return CustomPaint(
            foregroundPainter: _IndicatorPainter(
                indicatorColor: Theme.of(context).colorScheme.primary,
                currentIndex: _index,
                indicatorHeight: 7,
                animationValue: _animation,
                previousIndex: _previusIndex),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 54, 54, 54),
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(20),
                      topEnd: Radius.circular(20))),
              width: size.width,
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () => _changeIndex(0),
                      icon: Icon(
                        FontAwesomeIcons.house,
                        size: 22,
                        color: _index == 0
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromARGB(255, 153, 150, 150),
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () => _changeIndex(1),
                      icon: Icon(
                        FontAwesomeIcons.solidCompass,
                        size: 22,
                        color: _index == 1
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromARGB(255, 153, 150, 150),
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () => _changeIndex(2),
                      icon: Icon(
                        FontAwesomeIcons.bookBookmark,
                        size: 22,
                        color: _index == 2
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromARGB(255, 153, 150, 150),
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () => _changeIndex(3),
                      icon: Icon(
                        FontAwesomeIcons.user,
                        size: 22,
                        color: _index == 3
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromARGB(255, 153, 150, 150),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class _IndicatorPainter extends CustomPainter {
  final Paint _paint;
  final double indicatorHeight;
  final int currentIndex;
  final Animation<double> animationValue;
  final int previousIndex;
  _IndicatorPainter(
      {required Color indicatorColor,
      required this.animationValue,
      required this.previousIndex,
      required this.currentIndex,
      required this.indicatorHeight})
      : _paint = Paint()..color = indicatorColor;

  @override
  void paint(Canvas canvas, Size size) {
    double dx = _calculateOffset(currentIndex, size);

    double previousValue = _calculateOffset(previousIndex, size);
    double dxDelta = dx - previousValue;
    double dxFinal = previousValue + (dxDelta * animationValue.value);
    double dy = size.height - 8;
    print(
        'dx:$dx\ndxDelta:$dxDelta\ndxFinal:$dxFinal\npreviousValue:$previousValue\nanimationValue:${animationValue.status}');
    canvas.drawCircle(Offset(dxFinal, dy), indicatorHeight / 2, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  double _calculateOffset(int index, Size size) {
    double partition = (size.width / 8);

    double dx = (partition * (index + 1));
    index == 0 ? null : dx += partition * index;
    return dx;
  }
}
