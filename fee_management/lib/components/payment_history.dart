import 'package:flutter/material.dart';
import '../model/payment.dart';


class PaymentHistoryCard extends StatelessWidget {
  final Payment payment;
  
  const PaymentHistoryCard({
    super.key,
    required this.payment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${payment.amount.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Chip(
                  label: Text(payment.isInstallment ? 'Installment' : 'Full Payment'),
                  backgroundColor: payment.isInstallment 
                      ? Colors.blue.shade100 
                      : Colors.green.shade100,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Date: ${payment.paymentDate.toString().split(' ')[0]}'),
            if (payment.notes != null) ...[
              const SizedBox(height: 4),
              Text('Notes: ${payment.notes!}'),
            ],
          ],
        ),
      ),
    );
  }
}