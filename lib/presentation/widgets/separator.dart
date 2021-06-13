import 'package:flutter/material.dart';
import 'package:movieapp/presentation/themes/app_color.dart';

class Separator extends StatelessWidget {
  const Separator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 80,
      padding: EdgeInsets.only(top: 2, bottom: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          gradient:
              LinearGradient(colors: [AppColor.violet, AppColor.royalBlue])),
    );
  }
}
