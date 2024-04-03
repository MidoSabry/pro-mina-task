import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_pro_mina/core/theming/styles.dart';
import 'package:task_pro_mina/core/utils/app_string.dart';

class HeaderWidget extends StatelessWidget {
  final String userName;
  const HeaderWidget({super.key,required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.0.h, horizontal: 40.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppString.welcomTxt,
                  style: TextStyles.font32GraySemiBold
                      .copyWith(fontFamily: 'Baloo')),
              Text(userName,
                  style: TextStyles.font32GraySemiBold
                      .copyWith(fontFamily: 'Baloo'))
            ],
          ),
          SizedBox(
            height: 66.h,
            width: 66.w,
            child: Image.asset(
              'assets/images/person.png', // Adjust the path to your image
            ),
          ),
        ],
      ),
    );
  }
}
