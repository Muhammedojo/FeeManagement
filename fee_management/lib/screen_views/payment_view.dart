import 'package:flutter/material.dart';

import '../model/payment.dart';
import '../screen_controllers/payment_controller.dart';
import '../utils/mvc.dart';
import '../utils/widget_wrapper.dart';

class PaymentView extends StatelessView<Payments, PaymentController> {
  const PaymentView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Payment',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),

      body: WidgetWrapper(child: _body(context)),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: state.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Student: ${widget.student.name}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text('Grade: ${widget.student.grade}'),
            const SizedBox(height: 24),

            TextFormField(
              controller: state.amountController,
              decoration: const InputDecoration(
                labelText: 'Amount',
                prefixText: '\$',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter amount';
                }
                final amount = double.tryParse(value);

                if (amount == null) {
                  return 'Please enter valid amount';
                }
                if (amount <= 0) {
                  return 'Amount must be positive';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            CheckboxListTile(
              title: const Text('This is an installment payment'),
              value: state.isInstallment,
              onChanged: (value) {
                if (value != null) {
                  state.setInstallment(value);
                }
              },
            ),

            const SizedBox(height: 16),

            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Notes (Optional)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => state.notes = value,
              maxLines: 2,
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => submitPayment(context),
                child: const Text('Submit Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submitPayment(BuildContext context) {
    final formState = state.formKey.currentState;
    if (formState != null && formState.validate()) {
      try {
        final payment = Payment(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          studentId: widget.student.id,
          amount: double.parse(state.amountController.text),
          paymentDate: DateTime.now(),
          isInstallment: state.isInstallment,
          notes: state.notes.trim().isNotEmpty ? state.notes.trim() : null,
        );

        widget.onPaymentSuccess(payment);
        if (context.mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error processing payment: $e')));
      }
    }
  }
}
