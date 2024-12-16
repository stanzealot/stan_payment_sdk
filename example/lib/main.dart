import 'package:flutter/material.dart';
import 'package:flick_sdk/flick_sdk.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlickExample(),
    );
  }
}

class FlickExample extends StatelessWidget {
  final FlickSdk flickSdk = FlickSdk(
    apiKey: 'Your secret api key',
    amount: '1000',
    currencyCollected: 'USD',
    currencySettled: 'USD',
    PhoneNo: '08067302418',
    email: 'example@mail.com',
    transactionId: 'Flick-5yfr733y5yrrscfd45',
    redirectUrl: 'https://your_redirect_url.com',
    webhookUrl: 'https://your_webhook_url.com',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flick SDK Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => flickSdk.createCharge(context),
          child: const Text('Make Payment'),
        ),
      ),
    );
  }
}
