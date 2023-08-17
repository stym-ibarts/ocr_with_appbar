import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr/widgets/color.dart';

class TransactionItem extends StatelessWidget {
  final String nameofConsumer;
  final String invoiceNumber;
  final String date;

  const TransactionItem({
    Key? key,
    required this.nameofConsumer,
    required this.invoiceNumber,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          '/transactiondetails',
          arguments: {
            'nameofConsumer': nameofConsumer,
            'invoiceNumber': invoiceNumber,
            'creationDate': date,
          },
        );
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameofConsumer,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.blackText,
                    ),
                  ),
                  invoiceNumber != 'null' ?
                  Text(
                    invoiceNumber,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.textRed,
                    ),
                  ): const SizedBox.shrink(),
                  date != 'null' ?
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.greyText,
                    ),
                  ) : const SizedBox.shrink(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundBlack,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: const Text(
                  "Reward",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.whiteText,
                    backgroundColor: AppColors.backgroundBlack,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
