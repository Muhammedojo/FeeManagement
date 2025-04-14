

import '../model/fee_structure.dart';
import '../model/student.dart';

class FeeCalculator {
  static double calculateTotalFee({
    required Student student,
    required FeeStructure feeStructure,
    required DateTime currentDate,
    required double paidAmount,
  }) {
    double totalFee = feeStructure.tuitionFee;
    
    
    if (student.hasSibling) {
      totalFee -= feeStructure.tuitionFee * feeStructure.siblingDiscount;
    }
    
    if (student.isTopPerformer) {
      totalFee -= feeStructure.tuitionFee * feeStructure.meritDiscount;
    }
    
    
    final daysSinceAdmission = currentDate.difference(student.admissionDate).inDays;
    if (daysSinceAdmission <= 7) {
      totalFee -= feeStructure.tuitionFee * feeStructure.earlyBirdDiscount;
    }
    

    if (daysSinceAdmission > 10) {
      totalFee += feeStructure.tuitionFee * feeStructure.latePenalty;
    }
    
    return totalFee - paidAmount;
  }

  static String getPaymentStatus({
    required double dueAmount,
    required DateTime admissionDate,
    required DateTime currentDate,
  }) {
    final daysOverdue = currentDate.difference(admissionDate).inDays - 10;
    
    if (dueAmount <= 0) {
      return 'Paid';
    } else if (daysOverdue >= 30) {
      return 'Pending Payment';
    } else if (daysOverdue > 10) {
      return 'Late';
    } else {
      return 'Due';
    }
  }
}