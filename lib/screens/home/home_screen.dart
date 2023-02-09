import 'package:e_frontend/screens/home/components/banner_section.dart';
import 'package:flutter/material.dart';
import 'components/header_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [
        HeaderContainer(),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: BannerSection(),
        ),
      ]),
    );
  }
}
