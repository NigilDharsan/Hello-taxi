import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellotaxi/utils/dimensions.dart';
import 'package:hellotaxi/utils/styles.dart';

class TitleWidget extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  const TitleWidget({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title!,
          style:
              ubuntuMedium.copyWith(fontSize: Dimensions.fontSizeExtraLarge)),
      (onTap != null)
          ? InkWell(
              onTap: onTap,
              child: Text(
                'see_all'.tr,
                style: ubuntuMedium.copyWith(
                  decoration: TextDecoration.underline,
                  color: Get.isDarkMode
                      ? Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color!
                          .withOpacity(.6)
                      : Theme.of(context).primaryColor,
                  fontSize: Dimensions.fontSizeDefault,
                ),
              ),
            )
          : const SizedBox(),
    ]);
  }
}
