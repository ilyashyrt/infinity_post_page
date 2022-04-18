import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar {
  static AppBar customAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: const Icon(
        FontAwesomeIcons.twitter,
        color: Colors.blue,
      ),
      bottom: PreferredSize(
          child: Container(
            color: Colors.white,
            height: 0.6.h,
          ),
          preferredSize: const Size.fromHeight(4.0)),
    );
  }
}
