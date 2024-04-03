import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_pro_mina/core/services/services_locator.dart';
import 'package:task_pro_mina/core/utils/app_string.dart';
import 'package:task_pro_mina/features/home/presentation/cubit/gellary_cubit.dart';
import 'package:task_pro_mina/features/home/presentation/widgets/gellary_btn_widget.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 180.h),
      child: AlertDialog(
          backgroundColor: Colors.transparent, content: contentBox(context)),
    );
  }

  Widget contentBox(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 8.0), // Apply blur effect
        child: Container(
          width: 400.w,
          height: 320.h, // Adjust height as needed
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.35), // Semi-transparent gray color
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.white, // Border color
            ), // Rounded corners
          ),
          child: Center(
            child: BlocProvider(
              create: (context) => sl<GellaryCubit>(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocBuilder<GellaryCubit, GellaryState>(
                    builder: (context, state) {
                      return GellaryBtn(
                          btnText: AppString.gellaryTxt,
                          color: Colors.white.withOpacity(0.5),
                          height: 60.h,
                          width: 145.w,
                          imgText: 'assets/images/image.png',
                          onPressed: () {
                            context.read<GellaryCubit>().getImageFromGallery();
                          });
                    },
                  ),
                  BlocBuilder<GellaryCubit, GellaryState>(
                    builder: (context, state) {
                      return GellaryBtn(
                          btnText: AppString.cameraTxt,
                          color: Colors.white.withOpacity(0.9),
                          height: 60.h,
                          width: 145.w,
                          imgText: 'assets/images/camera.png',
                          onPressed: () {
                            context.read<GellaryCubit>().getImageFromCamera();
                          });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
