import 'package:flutter/material.dart';
import '/screens/home/components/header.dart';
import '../../constants.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          Container(
            height: 71,
            decoration: const BoxDecoration(
              color: Color(0xFFffffff),
              boxShadow: [
                BoxShadow(
                  color: ColorsTheme.grayColor,
                  blurRadius: 3.0,
                )
              ],
            ),
            child: Header(),
          ),
        ],
      ),
    );
  }
}
