import 'package:flutter/material.dart';


// ignore: must_be_immutable
class BottomNav extends StatelessWidget {
  final PageController controller;
  const BottomNav({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {

    final primaryColor = Theme.of(context).primaryColor;


    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      color: primaryColor,
      child: SizedBox(
        height: 63,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: (){
                  controller.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                },
                icon: const Icon(Icons.home,color:Colors.black ,)),
            const SizedBox(),
            IconButton(onPressed: (){
              controller.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
            }, icon: const Icon(Icons.bookmark,color:Colors.black ,)),
          ],
        ),
      ),
    );
  }
}
