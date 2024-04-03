import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pro_mina/core/services/services_locator.dart';
import 'package:task_pro_mina/features/auth/data/model/user_model.dart';
import 'package:task_pro_mina/features/auth/presentation/cubit/login_cubit.dart';
import 'package:task_pro_mina/features/auth/presentation/widgets/login_card_widget.dart';
import 'package:task_pro_mina/features/home/presentation/screen/my_gellary_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => sl<LoginCubit>(),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image widget to display the background image
            Image.asset(
              'assets/images/login.png', // Adjust the path to your image
              fit: BoxFit.cover,
            ),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is LoginSuccess) {
                  UserModel userModel = UserModel(
                      id: context.read<LoginCubit>().userModel!.id,
                      name: context.read<LoginCubit>().userModel!.name,
                      email: context.read<LoginCubit>().userModel!.email,
                      token: context.read<LoginCubit>().userModel!.token);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyGellaryScreen(userModel: userModel)),
                  );
                } else if (state is LoginError) {
                  // Show SnackBar when button is pressed
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.messageError.toString()),
                      duration: const Duration(
                          seconds:
                              3), // Duration for which SnackBar will be visible
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const LoginCardWidget();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
