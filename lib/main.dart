import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:window_app/src/presentation/home_view/home_view.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeView(),
        );
      },
    );
  }
}
