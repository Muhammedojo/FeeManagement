class FeeStructure {
  final String grade;
  final double tuitionFee;
  final double siblingDiscount;
  final double meritDiscount;
  final double earlyBirdDiscount;
  final double latePenalty;

  const FeeStructure({
    required this.grade,
    required this.tuitionFee,
    this.siblingDiscount = 0.1,
    this.meritDiscount = 0.15,
    this.earlyBirdDiscount = 0.05,
    this.latePenalty = 0.05,
  });
}