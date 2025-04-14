import 'package:fee_management/screen_controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import '../components/fee_card.dart';
import '../components/payment_history.dart';
import '../screen_controllers/student_profile_controller.dart';
import '../utils/mvc.dart';
import '../utils/widget_wrapper.dart';

class StudentProfileView
    extends StatelessView<StudentProfile, StudentProfileController> {
  const StudentProfileView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          widget.student.name,
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
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Text(
            'Grade: ${widget.student.grade}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Admission Date: ${widget.student.admissionDate.toString().split(' ')[0]}',
          ),
          const SizedBox(height: 16),
      
          FeeCard(
            totalFee: widget.feeStructure.tuitionFee,
            paidAmount: state.paidAmount,
            dueAmount: state.dueAmount,
            status: state.paymentStatus,
          ),
      
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment History',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => Payments(
                            student: widget.student,
                            feeStructure: widget.feeStructure,
                            onPaymentSuccess: (payment) {
                              // setState(() {
                              //   payments.add(payment);
                              // });
                            },
                          ),
                    ),
                  );
                },
      
                child: const Text('Make Payment'),
              ),
            ],
          ),
      
          if (state.payments.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('No payment history found'),
            )
          else
            ...state.payments.map(
              (payment) => PaymentHistoryCard(payment: payment),
            ),
        ],
      ),
    );
  }

  navigateToPaymentScreen(context) {}
}
