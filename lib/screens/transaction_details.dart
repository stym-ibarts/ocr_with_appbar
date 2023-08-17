import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/appbar.dart';
import '../widgets/color.dart';
// import '../widgets/transaction_item.dart';

class TransactionDetails extends StatefulWidget {
  const TransactionDetails({super.key});

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  final String? nameofConsumer = Get.arguments['nameofConsumer'];
  final String? invoiceNumber = Get.arguments['invoiceNumber'];
  final String? creationDate = Get.arguments['creationDate'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OCRAppBar(
        title: "Transaction Details",
        bgcolor: AppColors.textRed,
        iconAssetPath: "assets/icon/back.png",
      ).preferredSize(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/transactionhistory.png'),
                fit: BoxFit.cover, // Choose an appropriate BoxFit
              ),
            ),
          ),
          SingleChildScrollView(
            child: Card(
              // color: Colors.transparent,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextRow("Name of Consumer", nameofConsumer!),
                  _buildTextRow("Invoice Number", invoiceNumber!),
                  _buildTextRow("Amount", "\$457"),
                  _buildRowWithImage(
                      "Status", "Done", 'assets/icon/loading.png'),
                  _buildRowWithImage("Destination", "Mastercard-5816",
                      'assets/icon/mastercard.png'),
                  _buildRowWithImage(
                      "Date", creationDate!, 'assets/icon/date.png'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 16, color: AppColors.greyText),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildRowWithImage(String label, String value, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 0, bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(label),
              // Text(value),
              _buildTextRow(label, value),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 15),
            child: Image.asset(
              imagePath,
              alignment: Alignment.centerRight,
              height: 45.0,
              width: 30.0,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
