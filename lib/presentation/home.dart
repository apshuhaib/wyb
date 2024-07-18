import 'package:flutter/material.dart';
import 'package:wy/presentation/color__page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isSwipeLeft = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.blue,
        ),
        centerTitle: true,
        title: const Text('Transfer'),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Who do you want to \n transfer money to?',
                      style: TextStyle(color: Colors.grey, fontSize: 30),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[700],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          ),
                          Text(
                            'New',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _isSwipeLeft = page > _currentPage;
                      _currentPage = page;
                    });
                  },
                  children: [
                    ColorPage(isSwipeLeft: _isSwipeLeft),
                    ColorPage(isSwipeLeft: _isSwipeLeft),
                  ],
                ),
              ),
              const SizedBox(height: 180),
            ],
          ),
          Positioned(
            left: -30,
            bottom: -30,
            child: DraggableButton(),
          ),
        ],
      ),
    );
  }
}

class DraggableButton extends StatefulWidget {
  @override
  _DraggableButtonState createState() => _DraggableButtonState();
}

class _DraggableButtonState extends State<DraggableButton> {
  double _left = 0;
  double _bottom = 0;
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (_) {
        setState(() {
          _isDragging = true;
        });
      },
      onPanUpdate: (details) {
        setState(() {
          _left += details.delta.dx;
          _bottom -= details.delta.dy;

          if (_left < 0) {
            _left = 0;
          }
          if (_bottom < 0) {
            _bottom = 0;
          }
          if (_left > MediaQuery.of(context).size.width - 100) {
            _left = MediaQuery.of(context).size.width - 100;
          }
          if (_bottom > MediaQuery.of(context).size.height - 100) {
            _bottom = MediaQuery.of(context).size.height - 100;
          }
        });
      },
      onPanEnd: (_) {
        setState(() {
          _isDragging = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 210,
        height: 210,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SALARY',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '12,475',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
