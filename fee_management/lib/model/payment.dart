class Payment {
  final String id;
  final String studentId;
  final double amount;
  final DateTime paymentDate;
  final bool isInstallment;
  final String? notes;

  const Payment({
    required this.id,
    required this.studentId,
    required this.amount,
    required this.paymentDate,
    this.isInstallment = false,
    this.notes,
  });
}