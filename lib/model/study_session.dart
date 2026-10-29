enum SessionStatus { pending, done }

class StudySession {
  final String title;
  final String description;
  final String date;
  final String time;
  final SessionStatus status;

  const StudySession({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.status,
  });
}
