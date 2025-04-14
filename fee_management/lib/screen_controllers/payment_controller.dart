import 'package:flutter/material.dart';

import '../model/fee_structure.dart';
import '../model/payment.dart';
import '../model/student.dart';
import '../screen_views/payment_view.dart';

class Payments extends StatefulWidget {
  final Student student;
  final FeeStructure feeStructure;
  final Function(Payment) onPaymentSuccess;
  const Payments({
    super.key,
    required this.student,
    required this.feeStructure,
    required this.onPaymentSuccess,
  });

  @override
  PaymentController createState() => PaymentController();
}

class PaymentController extends State<Payments> {
  //... //Initialization code, state vars etc, all go here

  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  bool isInstallment = false;
  String notes = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  setInstallment(bool value) {
    setState(() {
      isInstallment = value;
    });
  }

  @override
  Widget build(BuildContext context) => PaymentView(this);
}
