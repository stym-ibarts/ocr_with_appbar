class InvoiceModel {
  String ocrType;
  String requestId;
  String fileName;
  int requestReceivedOn;
  bool success;
  int imageWidth;
  int imageHeight;
  double imageRotation;
  int recognitionCompletedOn;
  List<Receipt> receipts;

  InvoiceModel({
    required this.ocrType,
    required this.requestId,
    required this.fileName,
    required this.requestReceivedOn,
    required this.success,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageRotation,
    required this.recognitionCompletedOn,
    required this.receipts,
  });

  // InvoiceModel.fromJson(Map<String, dynamic> json)
  //     : ocrType = json['ocr_type'],
  //       requestId = json['request_id'],
  //       fileName = json['file_name'],
  //       requestReceivedOn = json['request_received_on'],
  //       success = json['success'],
  //       imageWidth = json['image_width'],
  //       imageHeight = json['image_height'],
  //       imageRotation = json['image_rotation'],
  //       recognitionCompletedOn = json['recognition_completed_on'],
  //       receipts = json['receipts'];
}

class Receipt {
  String merchantName;
  String merchantAddress;
  String merchantPhone;
  dynamic merchantWebsite;
  dynamic merchantTaxRegNo;
  dynamic merchantCompanyRegNo;
  dynamic region;
  dynamic mall;
  String country;
  dynamic receiptNo;
  DateTime date;
  dynamic time;
  List<Item> items;
  String currency;
  int total;
  dynamic subtotal;
  double tax;
  dynamic serviceCharge;
  dynamic tip;
  dynamic paymentMethod;
  dynamic paymentDetails;
  dynamic creditCardType;
  dynamic creditCardNumber;
  String ocrText;
  double ocrConfidence;
  int width;
  int height;
  double avgCharWidth;
  double avgLineHeight;
  int confAmount;
  SourceLocations sourceLocations;

  Receipt({
    required this.merchantName,
    required this.merchantAddress,
    required this.merchantPhone,
    this.merchantWebsite,
    this.merchantTaxRegNo,
    this.merchantCompanyRegNo,
    this.region,
    this.mall,
    required this.country,
    this.receiptNo,
    required this.date,
    this.time,
    required this.items,
    required this.currency,
    required this.total,
    this.subtotal,
    required this.tax,
    this.serviceCharge,
    this.tip,
    this.paymentMethod,
    this.paymentDetails,
    this.creditCardType,
    this.creditCardNumber,
    required this.ocrText,
    required this.ocrConfidence,
    required this.width,
    required this.height,
    required this.avgCharWidth,
    required this.avgLineHeight,
    required this.confAmount,
    required this.sourceLocations,
  });
}

class Item {
  double amount;
  dynamic category;
  String description;
  String flags;
  dynamic qty;
  dynamic remarks;
  dynamic tags;
  dynamic unitPrice;

  Item({
    required this.amount,
    this.category,
    required this.description,
    required this.flags,
    this.qty,
    this.remarks,
    this.tags,
    this.unitPrice,
  });
}

class SourceLocations {
  List<List<Date>> date;
  List<List<Date>> total;
  List<List<Date>> merchantName;
  List<List<Date>> doc;
  List<List<Date>> tax;
  List<List<Date>> merchantPhone;

  SourceLocations({
    required this.date,
    required this.total,
    required this.merchantName,
    required this.doc,
    required this.tax,
    required this.merchantPhone,
  });
}

class Date {
  int y;
  int x;

  Date({
    required this.y,
    required this.x,
  });
}
