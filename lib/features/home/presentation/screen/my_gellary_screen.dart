import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_pro_mina/core/services/services_locator.dart';
import 'package:task_pro_mina/core/theming/colors.dart';
import 'package:task_pro_mina/core/utils/app_string.dart';
import 'package:task_pro_mina/features/auth/data/model/user_model.dart';
import 'package:task_pro_mina/features/auth/presentation/screens/login_screen.dart';
import 'package:task_pro_mina/features/home/presentation/cubit/gellary_cubit.dart';
import 'package:task_pro_mina/features/home/presentation/widgets/custom_dialog_widget.dart';
import 'package:task_pro_mina/features/home/presentation/widgets/gellary_btn_widget.dart';
import 'package:task_pro_mina/features/home/presentation/widgets/grid_item_widget.dart';
import 'package:task_pro_mina/features/home/presentation/widgets/header_widget.dart';

class MyGellaryScreen extends StatelessWidget {
  final UserModel userModel;
  const MyGellaryScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            sl<GellaryCubit>()..getGellaryOfUser(userModel.token),
        child: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Image widget to display the background image
              Image.asset(
                'assets/images/gellary.png', // Adjust the path to your image
                fit: BoxFit.fill,
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    HeaderWidget(userName: userModel.name),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GellaryBtn(
                            btnText: AppString.logoutTxt,
                            imgText: 'assets/images/logoutbtn.png',
                            color: ColorsManager.white,
                            height: 45.h,
                            width: 145.w,
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              );
                            }),
                        GellaryBtn(
                            btnText: AppString.uploadBtnTxt,
                            imgText: 'assets/images/uploadbtn.png',
                            color: ColorsManager.white,
                            height: 45.h,
                            width: 145.w,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const CustomDialog(); // Custom dialog widget
                                },
                              );
                            })
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: BlocBuilder<GellaryCubit, GellaryState>(
                        builder: (context, state) {
                          if (state is GellarySuccess) {
                            return GridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisCount: 3, // Number of items per row
                              children: List.generate(
                                  state.gellaryEntity.images.length, (index) {
                                return GridItemWidget(index);
                              }),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
