import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:more_chat/common/library/db_util.dart';
import 'common/routers/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBUtil().init();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 全局设置透明appBar
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return GetMaterialApp(
      title: "More Chat",
      initialRoute: AppPages.InitRoute,
      // 默认路由
      getPages: AppPages.routers,
      // 页面表
      unknownRoute: AppPages.unknownRoute,
      // 404路由

      // 基础配置
      debugShowCheckedModeBanner: false, // 不显示debug
    );
  }
}
