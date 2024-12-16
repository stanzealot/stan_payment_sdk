import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class FlickSdk {
  final String apiKey;
  final String amount;
  final String currencyCollected;
  final String currencySettled;
  final String PhoneNo;
  final String email;
  final String transactionId;
  final String? redirectUrl;
  final String? webhookUrl;

  FlickSdk({
    required this.apiKey,
    required this.amount,
    required this.currencyCollected,
    required this.currencySettled,
    required this.PhoneNo,
    required this.email,
    required this.transactionId,
    this.redirectUrl,
    this.webhookUrl,
  });

  Future<void> createCharge(BuildContext context) async {
    final url = Uri.parse('https://flickopenapi.co/collection/create-charge');
    final headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };

    final body = {
      "amount": amount,
      "currency_collected": currencyCollected,
      "currency_settled": currencySettled,
      "Phoneno": PhoneNo,
      "email": email,
      "transactionId": transactionId,
      "redirectUrl": redirectUrl,
      "webhookUrl": webhookUrl,
    }..removeWhere((key, value) => value == null);

    // Show loader
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final response =
          await http.post(url, headers: headers, body: json.encode(body));
      Navigator.of(context).pop(); // Remove loader
      // print(json.decode(response.body));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final checkoutUrl = Uri.parse(responseData['data']['url']);

        if (await canLaunchUrl(checkoutUrl)) {
          await launchUrl(checkoutUrl,
              mode: LaunchMode.externalApplication); // Open in browser
        } else {
          _showErrorDialog(context, 'Could not launch URL');
        }
      } else {
        _showErrorDialog(context, 'Failed to create charge. Please try again.');
      }
    } catch (e) {
      Navigator.of(context).pop(); // Remove loader
      _showErrorDialog(context, 'An error occurred: $e');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
