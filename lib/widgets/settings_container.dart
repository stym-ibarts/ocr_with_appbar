import 'package:flutter/material.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer(
      {super.key, required this.boxText, required this.imgPath, this.onTap});
  final String boxText;
  final String imgPath;
  final Function()? onTap;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 10,
        height: 62,
        decoration: const BoxDecoration(
            color: Color(0xFFFF7E7E),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Image(image: AssetImage(imgPath)),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  boxText,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
                width: 40,
                child:
                    Image(image: AssetImage('assets/images/settings/arrow.png')))
          ],
        ),
      ),
    );
  }
}
