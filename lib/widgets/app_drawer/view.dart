import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_rate/helper/shared_files.dart';
import 'package:skill_rate/helper/styles.dart';
import 'package:skill_rate/widgets/app_drawer/controller.dart';
import 'package:skill_rate/widgets/button.dart';
import 'package:skill_rate/widgets/flutter_bounce.dart';

import '../dotted_line.dart';

class AppDrawerView extends StatelessWidget {
  AppDrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppDrawerController>(
      init: AppDrawerController(),
      builder: (controller) {
        return Container(
          height: height(context),
          width: width(context) * 0.75,
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.symmetric(
            vertical: AppMethods.DEFAULT_PADDING / 2,
            horizontal: AppMethods.DEFAULT_PADDING,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Bounce(
                    onPressed: () {
                      Get.back();
                    },
                    child: Icon(
                      CupertinoIcons.forward,
                      size: 20,
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                  Text(
                    "Options",
                    style: textStyleMenu(
                      context: context,
                      fontSize: FontSize.H3,
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Icon(
                      CupertinoIcons.forward,
                      size: 20,
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppMethods.DEFAULT_PADDING,
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    menuItem(context, "Setting", () => {}),
                    menuItem(context, "Contact us", () => {}),
                    menuItem(context, "Help and Feedback", () => {}),
                    menuItem(context, "Security", () => {}),
                  ],
                ),
              ),
              SizedBox(
                height: AppMethods.DEFAULT_PADDING / 2,
              ),
              AppButton(
                text: "LOGOUT",
                onTap: () {},
                buttonTextStyle: textStyleMenu(
                  context: context,
                  color: Theme.of(context).cardColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget menuItem(BuildContext context, String title, Function() onPressed) {
    return Bounce(
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppMethods.DEFAULT_PADDING,
          ),
          Text(
            title,
            style: textStyleMenu(
              context: context,
            ),
          ),
          SizedBox(
            height: AppMethods.DEFAULT_PADDING,
          ),
          DottedLine(
            dashLength: 4,
            dashColor: Theme.of(context).shadowColor.withOpacity(0.25),
          )
        ],
      ),
    );
  }
}
