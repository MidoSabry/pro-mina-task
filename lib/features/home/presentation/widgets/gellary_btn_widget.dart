import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_pro_mina/core/theming/styles.dart';

class GellaryBtn extends StatelessWidget {
  final String btnText;
  final String imgText;
  final VoidCallback onPressed;
  final Color color;
  final double height;
  final double width;

  const GellaryBtn(
      {super.key,
      required this.btnText,
      required this.imgText,
      required this.onPressed,
      required this.color,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius:
              BorderRadius.circular(8.0), // Set the radius of the corners
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 30.h,
              width: 28.w,
              child: Image.asset(
                imgText, // Adjust the path to your image
              ),
            ),
            Text(
              btnText,
              style:
                  TextStyles.font20GraySemiBold.copyWith(fontFamily: 'Baloo'),
            )
          ],
        ),
      ),
    );
  }
}
