import 'package:flutter/material.dart';

import '../model/fee_structure.dart';
import '../model/payment.dart';
import '../model/student.dart';
import '../screen_views/student_profile_view.dart';
import '../utils/fee_calculator.dart';

class StudentProfile extends StatefulWidget {
  final Student student;
  final FeeStructure feeStructure;

  const StudentProfile({
    super.key,
    required this.student,
    required this.feeStructure,
  });

  @override
  StudentProfileController createState() => StudentProfileController();
}

class StudentProfileController extends State<StudentProfile> {
  late double paidAmount;
  late double dueAmount;
  late String paymentStatus;
  late DateTime currentDate;
  //... //Initialization code, state vars etc, all go here

  List<Payment> payments = [
    Payment(
      id: '1',
      studentId: '1',
      amount: 500,
      paymentDate: DateTime(2023, 10, 15),
      isInstallment: true,
      notes: 'First installment',
    ),
  ];

  @override
  void initState() {
    super.initState();
    calculateFeeDetails();
  }

  void calculateFeeDetails() {
    final studentPayments =
        payments.where((p) => p.studentId == widget.student.id).toList();

    currentDate = DateTime.now();
    paidAmount = studentPayments.fold(
      0.0,
      (sum, payment) => sum + payment.amount,
    ); // Use 0.0 for double fold
    dueAmount = FeeCalculator.calculateTotalFee(
      student: widget.student,
      feeStructure: widget.feeStructure,
      currentDate: currentDate,
      paidAmount: paidAmount,
    );
    paymentStatus = FeeCalculator.getPaymentStatus(
      dueAmount: dueAmount,
      admissionDate: widget.student.admissionDate,
      currentDate: currentDate,
    );
  }

  

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => StudentProfileView(this);
}
