import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({Key? key, required this.icon}) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.r),
      child: AspectRatio(
        aspectRatio: 1,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
