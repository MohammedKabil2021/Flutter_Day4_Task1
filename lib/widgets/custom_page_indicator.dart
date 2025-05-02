import 'package:flutter/material.dart';

class CustomPageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const CustomPageIndicator({
    Key? key,
    required this.currentPage,
    required this.totalPages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: 8,
          width: currentPage == index ? 25 : 12,
          decoration: BoxDecoration(
            color: currentPage == index ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}
