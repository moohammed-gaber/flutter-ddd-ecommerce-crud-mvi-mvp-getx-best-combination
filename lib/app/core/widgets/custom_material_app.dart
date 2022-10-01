import 'package:ecommerce_crud_operation/app/core/config/dio.dart';
import 'package:ecommerce_crud_operation/app/core/device/custom_file_picker.dart';
import 'package:ecommerce_crud_operation/app/core/device/device_permission.dart';
import 'package:ecommerce_crud_operation/app/core/repos/product_repo.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/repository/auth_repo.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/infrastructure/data_sources/auth_local_data_source.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/infrastructure/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/infrastructure/repositories/auth_repo_impl.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_color/add_color_controller.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_color/add_color_state.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_size/add_size_controller.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_size/add_size_state.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/mappers/add_product_mapper.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/repos/add_product_repo.dart';
import 'package:ecommerce_crud_operation/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({Key? key, required this.appPages}) : super(key: key);
  final AppPages appPages;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return SafeArea(
          child: child!,
        );
      },
      theme: ThemeData(
        primaryColor: Colors.orange,
          inputDecorationTheme: InputDecorationTheme(
              border: InputBorder.none,
              fillColor: Color(0xfff3f3f4),
              filled: true),
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.latoTextTheme()),
      title: "Application",
      initialRoute: appPages.initialRoute,
      getPages: appPages.routes,
    );
  }
}

