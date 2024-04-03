import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_pro_mina/core/theming/colors.dart';
import 'package:task_pro_mina/core/theming/styles.dart';
import 'package:task_pro_mina/core/utils/app_string.dart';
import 'package:task_pro_mina/features/auth/presentation/widgets/app_text_form_field.dart';

import '../cubit/login_cubit.dart';

class LoginCardWidget extends StatelessWidget {
  const LoginCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 125.h,
      top: 360.h, // Adjust the value to move the container down
      child: Center(
        child: ClipRect(
          child: BackdropFilter(
            filter:
                ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Apply blur effect
            child: Container(
              width: 345.w, // Adjust width as needed
              height: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white
                    .withOpacity(0.7), // Semi-transparent gray color
                borderRadius: BorderRadius.circular(16.0), // Rounded corners
              ),
              child: Form(
                key: context.read<LoginCubit>().formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      AppString.login,
                      style: TextStyles.font30GrayBold,
                    ),
                    AppTextFormField(
                      controller: context.read<LoginCubit>().emailController,
                      hintText: AppString.userName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppString.validatorUserName;
                        }
                      },
                    ),
                    AppTextFormField(
                      controller: context.read<LoginCubit>().passwordController,
                      hintText: AppString.password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppString.validatorUserName;
                        }
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.btnColor,
                        ),
                        onPressed: () {
                          // Add your login logic here
                          validateThenDoLogin(context);
                        },
                        child: Text(
                          AppString.submitBtn,
                          style: TextStyles.font18WhiteBold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().loginUser();
    }
  }
}
