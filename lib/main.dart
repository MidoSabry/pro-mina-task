import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_pro_mina/core/services/services_locator.dart';
import 'package:task_pro_mina/core/utils/app_string.dart';
import 'package:task_pro_mina/features/auth/presentation/screens/login_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

// void main() => runApp(
//       DevicePreview(
//         enabled: true,
//         builder: (context) => MyApp(), // Wrap your app
//       ),
//     );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(428, 926),
      minTextAdapt: true,
      child: MaterialApp(
        title: AppString.appName,
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
