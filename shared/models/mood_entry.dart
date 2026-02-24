class MoodEntry {
  final int moodScore;
  final double sleepHours;
  final List<String> tags;
  final String journal;
  final DateTime createdAt;

  MoodEntry({
    required this.moodScore,
    required this.sleepHours,
    required this.tags,
    required this.journal,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "moodScore": moodScore,
      "sleepHours": sleepHours,
      "tags": tags,
      "journal": journal,
      "createdAt": createdAt.toIso8601String(),
    };
  }
}
