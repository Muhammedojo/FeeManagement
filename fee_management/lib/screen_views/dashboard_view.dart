import 'package:fee_management/screen_controllers/student_profile_controller.dart';
import 'package:flutter/material.dart';

import '../components/student_widget.dart';
import '../screen_controllers/dashboard_controller.dart';
import '../utils/mvc.dart';
import '../utils/widget_wrapper.dart';

class DashboardView extends StatelessView<Dashboard, DashboardController> {
  const DashboardView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: Colors.redAccent),
            onPressed: () {state.signOut();},
          ),
        ],
      ),

      body: WidgetWrapper(child: _body(context)),
    );
  }

  Widget _body(BuildContext context) {
    return ListView.builder(
      itemCount: state.students.length,
      itemBuilder: (context, index) {
        final student = state.students[index];
        final feeStructure = state.feeStructures[student.grade]!;

        return InkWell(
          onTap: () {
                     Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)
                  => StudentProfile(
                    student: student,
                    feeStructure: feeStructure,
                  ),
                ),
              );
          },
          child: StudentCard(student: student, feeStructure: feeStructure));
  
      },
    );
  }
}
