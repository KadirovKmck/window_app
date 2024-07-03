import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:window_app/src/presentation/window_setting_view/app_bar.dart';

class WindowView extends StatelessWidget {
  const WindowView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            '1',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
          ),
          actions: const [
            AppBarAction(iconPath: 'assets/icons/back.svg'),
            AppBarAction(iconPath: 'assets/icons/next.svg'),
            AppBarIconButton(icon: Icons.add),
            AppBarPopupMenu(),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Divider(color: const Color(0xffe8e8e8), thickness: 0.2.h),
            SizedBox(height: 18.h, child: const IconsGrid()),
            Divider(color: const Color(0xffe8e8e8), thickness: 0.2.h),
            SizedBox(height: 12.h),
            const WindowDisplay(),
          ],
        ),
      ),
    );
  }
}

class IconsGrid extends StatelessWidget {
  const IconsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        crossAxisSpacing: 1.w,
        mainAxisSpacing: 1.w,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        String iconPath = 'assets/icons/icon${index + 1}.svg';
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Draggable<String>(
            data: iconPath,
            feedback: Container(
              height: 10.h,
              width: 10.w,
              color: Colors.blue.withOpacity(0.5),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            childWhenDragging: Opacity(
              opacity: 0.5,
              child: Container(
                height: 1.h,
                width: 1.w,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
            child: Container(
              height: 1.h,
              width: 1.w,
              color: Colors.grey,
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class WindowDisplay extends StatelessWidget {
  const WindowDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MeasurementColumn(),
        WindowGraphic(),
      ],
    );
  }
}

class MeasurementColumn extends StatelessWidget {
  const MeasurementColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MeasurementLine(width: 5.w, height: 0.2.h),
        MeasurementLine(width: 0.5.w, height: 10.h),
        SizedBox(height: 0.5.h),
        const Center(
          child: VerticalText(
            '1200',
          ),
        ),
        SizedBox(height: 0.5.h),
        MeasurementLine(width: 0.5.w, height: 10.h),
        MeasurementLine(width: 5.w, height: 0.2.h),
      ],
    );
  }
}

class WindowGraphic extends StatefulWidget {
  const WindowGraphic({super.key});

  @override
  _WindowGraphicState createState() => _WindowGraphicState();
}

class _WindowGraphicState extends State<WindowGraphic> {
  List<String> iconPaths = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DragTarget<String>(
          onAcceptWithDetails: (DragTargetDetails<String> details) {
            setState(() {
              iconPaths.add(details.data);
            });
          },
          builder: (context, candidateData, rejectedData) {
            int rows = (iconPaths.length / 2).ceil();
            int cols = iconPaths.length > 1 ? 2 : 1;
            double iconWidth = 250 / cols;
            double iconHeight = 150 / rows;

            return Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  ...iconPaths.asMap().entries.map((entry) {
                    int index = entry.key;
                    String iconPath = entry.value;

                    int row = index ~/ cols;
                    int col = index % cols;

                    return Positioned(
                      left: col * iconWidth,
                      top: row * iconHeight,
                      child: SvgPicture.asset(
                        iconPath,
                        width: iconWidth,
                        height: iconHeight,
                      ),
                    );
                  }),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class MeasurementLine extends StatelessWidget {
  final double width;
  final double height;

  const MeasurementLine({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(color: Colors.black),
    );
  }
}

class VerticalText extends StatelessWidget {
  final String text;

  const VerticalText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: text.split('').map((char) {
        return RotatedBox(
          quarterTurns: 1,
          child: Text(
            char,
            style: TextStyle(fontSize: 20.sp),
          ),
        );
      }).toList(),
    );
  }
}

class ResponsiveText extends StatelessWidget {
  final String text;
  final bool isBold;

  const ResponsiveText(this.text, {this.isBold = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16.sp,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }
}
