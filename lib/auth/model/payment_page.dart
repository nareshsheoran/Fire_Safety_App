import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];

  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Pay'),
      ),
      body: Center(
        child: GooglePayButton(
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height / 12.5,
          paymentConfigurationAsset: 'gpay.json',
          paymentItems: _paymentItems,
          style: GooglePayButtonStyle.white,
          type: GooglePayButtonType.pay,
          margin: const EdgeInsets.only(top: 15.0),
          onPaymentResult: onGooglePayResult,
          loadingIndicator: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
