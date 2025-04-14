class Student {
  final String id;
  final String name;
  final String grade;
  final bool hasSibling;
  final bool isTopPerformer;
  final DateTime admissionDate;

  const Student({
    required this.id,
    required this.name,
    required this.grade,
    required this.hasSibling,
    required this.isTopPerformer,
    required this.admissionDate,
  });
}