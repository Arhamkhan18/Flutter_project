import 'package:flutter/material.dart';
import 'order_success_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String paymentMethod = 'Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Select Payment Method:',
              style: TextStyle(fontSize: 18),
            ),
            ListTile(
              title: const Text('Credit/Debit Card'),
              leading: Radio(
                value: 'Card',
                groupValue: paymentMethod,
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value.toString();
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Cash on Delivery'),
              leading: Radio(
                value: 'Cash',
                groupValue: paymentMethod,
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value.toString();
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Google Pay / UPI'),
              leading: Radio(
                value: 'UPI',
                groupValue: paymentMethod,
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value.toString();
                  });
                },
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (paymentMethod == 'UPI') {
                  // Show UPI Payment Successful
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('UPI Payment Successful')),
                  );
                } else if (paymentMethod == 'Cash') {
                  // Show Cash on Delivery Confirmed
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Cash on Delivery Confirmed')),
                  );
                } else if (paymentMethod == 'Card') {
                  // Show Card Payment Successful
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Card Payment Successful')),
                  );
                }

                // Navigate to Order Success Page after showing message
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const OrderSuccessPage(),
                    ),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
