import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostsTextStyles {
  static final titleTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.bold),
  );

  static final bodyTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
  );
}
