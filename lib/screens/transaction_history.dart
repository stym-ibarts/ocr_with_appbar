import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ocr/widgets/appbar.dart';

import '../models/test_model.dart';
import '../widgets/color.dart';
import '../widgets/transaction_item.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  final displayName = FirebaseAuth.instance.currentUser!.displayName;
  // List<Map<String, dynamic>> transactions = [];
  List<TestModel> transactions = [];

  var isLoading = true;

  void readData() {
    // DatabaseReference dataUser = FirebaseDatabase.instance.ref(displayName!);
    DatabaseReference dataUser = FirebaseDatabase.instance.ref(displayName);

    dataUser.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;

      if (data != null && data is Map) {
        List<TestModel> newTransactions = [];
        // final DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm');

        data.forEach((key, value) {
          final item = value as Map;
          // print(item['name']);

          var finalData = jsonDecode(item['name']);

          var merchantName = finalData["receipts"][0]["merchant_name"];
          var date = finalData["receipts"][0]["date"];
          var receiptNo = finalData["receipts"][0]["receipt_no"];


          // print(finalData["receipts"][0]['receipt_no']);

          // final ocr_type = finalData["ocr_type"];

          // final name = item['name'];
          // final invoiceNumber = item['invoice_number'];
          // final creationTime = item['creation_time'];

          // DateTime creationDateTime =
          //     DateTime.fromMillisecondsSinceEpoch(creationTime);

          // String formattedDate = formatter.format(creationDateTime);

          TestModel newTransaction = TestModel(
            creationTime: date.toString(),
            invoiceNumber: receiptNo.toString(),
            name: merchantName.toString(),
          );

          newTransactions.add(newTransaction);

          setState(() {
            isLoading = false;
            transactions = newTransactions;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    readData();

    return Scaffold(
      appBar: const OCRAppBar(
        title: ("Transaction History"),
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
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.greyText))
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final name = transactions[index].name;
                      final invoiceNumber = transactions[index].invoiceNumber;
                      final creationDate = transactions[index].creationTime;

                      return TransactionItem(
                        date: creationDate,
                        invoiceNumber: invoiceNumber,
                        nameofConsumer: name,
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
