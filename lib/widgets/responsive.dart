import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive(
      {Key? key, required this.mobile, this.tablet, required this.desktop})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    print('Responsive build');
    print('${MediaQuery.of(context).size}');
    return LayoutBuilder(
      builder: ((BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1200) {
          print('Responsive Desktop');
          return desktop;
        } else if (constraints.maxWidth >= 800) {
          print('Responsive Tablet');
          return tablet ?? mobile;
        } else {
          print('Responsive Mobile');
          return mobile;
        }
      }),
    );
  }
}
