import 'package:flutter/material.dart';

class FeeCard extends StatelessWidget {
  final double totalFee;
  final double paidAmount;
  final double dueAmount;
  final String status;
  
  const FeeCard({
    super.key,
    required this.totalFee,
    required this.paidAmount,
    required this.dueAmount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Fee Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildFeeRow('Total Fee:', totalFee),
            _buildFeeRow('Paid Amount:', paidAmount),
            _buildFeeRow('Due Amount:', dueAmount, isHighlighted: true),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Status: '),
                Chip(
                  label: Text(status),
                  backgroundColor: _getStatusColor(status),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeeRow(String label, double amount, {bool isHighlighted = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: isHighlighted 
                ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                : null,
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return Colors.green.shade100;
      case 'due':
        return Colors.blue.shade100;
      case 'late':
        return Colors.orange.shade100;
      case 'pending payment':
        return Colors.red.shade100;
      default:
        return Colors.grey.shade100;
    }
  }
}