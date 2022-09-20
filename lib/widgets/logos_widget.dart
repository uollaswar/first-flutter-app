// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class LogosWidget extends StatelessWidget {
  const LogosWidget({
    Key? key,
    required this.link,
    this.onTapTechCompany,
  }) : super(key: key);
  final String link;
  final void Function()? onTapTechCompany;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(13),
      onTap: () {
        print(link);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(width: 1, color: Colors.black.withOpacity(0.1))),
        child: Image.asset(
          link,
          fit: BoxFit.cover,
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
