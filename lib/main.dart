import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kodemakers/screens/user_details_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        //initialBinding: DataBinding(),
        theme:
            ThemeData(textTheme: TextTheme(bodyText1: TextStyle(fontSize: 18))),
        home: ProfilePage(),
      ),
    );
  }
}
