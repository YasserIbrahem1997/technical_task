import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/view/screen/error_info.dart';


class TennisScreen extends StatelessWidget {
  const TennisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.asset(
                    "assets/images/svg/no_page_found.svg",
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              const Spacer(flex: 2),
              ErrorInfo(
                title: "Empty Tennis",
                description:
                "It looks like you don't have any Tennis right now. We'll let you know when there's something new.",
                // button: you can pass your custom button,

              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}







