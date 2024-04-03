import 'package:flutter/material.dart';

class GridItemWidget extends StatelessWidget {
  final int index;

  const GridItemWidget(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.0),
              image: const DecorationImage(
                image: AssetImage('assets/images/rrr.png'),
                fit: BoxFit.cover,
              ),
            ),
          );
       
  }
}
