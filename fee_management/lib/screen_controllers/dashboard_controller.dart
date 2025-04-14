import 'package:flutter/material.dart';

import '../model/fee_structure.dart';
import '../model/student.dart';
import '../screen_views/dashboard_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  DashboardController createState() => DashboardController();
}

class DashboardController extends State<Dashboard> {
  //... //Initialization code, state vars etc, all go here

  final List<Student> students = [
    Student(
      id: '1',
      name: 'John Doe',
      grade: 'Grade 10',
      hasSibling: true,
      isTopPerformer: false,
      admissionDate: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Student(
      id: '2',
      name: 'Jane Smith',
      grade: 'Grade 12',
      hasSibling: false,
      isTopPerformer: true,
      admissionDate: DateTime.now().subtract(const Duration(days: 15)),
    ),
  ];

  final Map<String, FeeStructure> feeStructures = {
    'Grade 10': const FeeStructure(grade: 'Grade 10', tuitionFee: 1000),
    'Grade 12': const FeeStructure(grade: 'Grade 12', tuitionFee: 1200),
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DashboardView(this);
}
