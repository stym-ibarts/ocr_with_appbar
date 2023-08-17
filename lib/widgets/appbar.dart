import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class OCRAppBar extends StatelessWidget {
  final String title;
  final Color bgcolor;
  final String iconAssetPath;
  final String trailingIcon;

  const OCRAppBar({
    required this.title,
    required this.bgcolor,
    super.key,
    this.iconAssetPath = "",
    this.trailingIcon = "",
  });

  @override
  Widget build(BuildContext context) {
    String settingsIcon = trailingIcon;
    // String backicon = iconAssetPath;

    return AppBar(
      backgroundColor: bgcolor,
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            child: iconAssetPath.isEmpty
                ? null
                : ImageIcon(AssetImage(iconAssetPath)),
          ),
        ),
        color: Colors.white,
        onPressed: null,
      ),
      actions: [
        if (settingsIcon.isNotEmpty)
          IconButton(
            color: Colors.white,
            icon: ImageIcon(AssetImage(settingsIcon)),
            iconSize: 70,
            onPressed: () {
              Get.toNamed('/settings');
            },
          ),
      ],
    );
  }

  PreferredSize preferredSize() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: this,
    );
  }
}
