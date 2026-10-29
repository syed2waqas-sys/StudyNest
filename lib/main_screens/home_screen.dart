import 'package:flutter/material.dart';
import 'package:assignment_project/model/study_session.dart';
import 'package:assignment_project/data/study_sessions.dart';
import 'package:assignment_project/main_screens/add_session.dart';
import 'package:assignment_project/main_screens/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  int get total => studySessions.length;

  int get pending => studySessions
      .where((session) => session.status == SessionStatus.pending)
      .length;

  int get done => studySessions
      .where((session) => session.status == SessionStatus.done)
      .length;

  Future<void> openAddSession() async {
    final result = await AddSessionScreen.show(context);

    if (!mounted) return;

    if (result == true) {
      setState(() {});
    }
  }

  void openProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      ),
    ).then((_) {
      if (mounted) {
        setState(() {
          _currentIndex = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F5FC),
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF3F3D9E),
                  Color(0xFF6B5BD6),
                  Color(0xFF8E7CF0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'StudyNest',
                      style: TextStyle(
                        color: Color(0xFFD6D2FF),
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Hello, Taba!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'You have $total sessions planned.',
                      style: const TextStyle(
                        color: Color(0xFFD6D2FF),
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Statistics
                    Row(
                      children: [
                        Expanded(
                          child: StatPill(
                            value: total,
                            label: 'Total',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: StatPill(
                            value: pending,
                            label: 'Pending',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: StatPill(
                            value: done,
                            label: 'Done',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Empty state or session list
          Expanded(
            child: studySessions.isEmpty
                ? const EmptyState()
                : ListView(
                    padding: const EdgeInsets.fromLTRB(16, 18, 16, 90),
                    children: [
                      const Text(
                        'Upcoming sessions',
                        style: TextStyle(
                          color: Color(0xFF1F1B3D),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(),
                        itemCount: studySessions.length,
                        itemBuilder: (context, index) {
                          final session = studySessions[index];

                          return Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10),
                            child: SessionCard(session: session),
                          );
                        },
                      ),
                    ],
                  ),
          ),
        ],
      ),

      // Add button
      floatingActionButton: FloatingActionButton(
        onPressed: openAddSession,
        backgroundColor: const Color(0xFFF2A93B),
        foregroundColor: const Color(0xFF29235A),
        child: const Icon(Icons.add),
      ),

      // Bottom navigation
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index == 1) {
              setState(() {
                _currentIndex = 1;
              });
              openProfile();
            } else {
              setState(() {
                _currentIndex = 0;
              });
            }
          },
          backgroundColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF3F3D9E),
          unselectedItemColor: const Color(0xFF6E6B8A),
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

// Empty state widget
class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(
                color: Color(0xFFEEECFA),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.chat_bubble_outline,
                size: 48,
                color: Color(0xFF3F3590),
              ),
            ),

            // TODO: replace the circle icon with a Lottie animation here

            const SizedBox(height: 20),
            const Text(
              'No study sessions yet',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF1F1B3D),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tap the + button to plan your first session.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF6E6B8A),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Statistics widget
class StatPill extends StatelessWidget {
  final int value;
  final String label;

  const StatPill({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$value',
            style: const TextStyle(
              color: Color(0xFF1F1B3D),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF6E6B8A),
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }
}

// Session card widget
class SessionCard extends StatelessWidget {
  final StudySession session;

  const SessionCard({
    super.key,
    required this.session,
  });

  @override
  Widget build(BuildContext context) {
    final isDone = session.status == SessionStatus.done;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x143F3D9E),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  session.title,
                  style: const TextStyle(
                    color: Color(0xFF1F1B3D),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isDone
                      ? const Color(0xFFD9F5E3)
                      : const Color(0xFFFFF0D2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  isDone ? 'Done' : 'Pending',
                  style: TextStyle(
                    color: isDone
                        ? const Color(0xFF2E9B5E)
                        : const Color(0xFFC98A1B),
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            session.description,
            style: const TextStyle(
              color: Color(0xFF6E6B8A),
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 11,
                color: Color(0xFF6E6B8A),
              ),
              const SizedBox(width: 4),
              Text(
                session.date,
                style: const TextStyle(
                  color: Color(0xFF6E6B8A),
                  fontSize: 9.5,
                ),
              ),
              const SizedBox(width: 14),
              const Icon(
                Icons.access_time,
                size: 11,
                color: Color(0xFF6E6B8A),
              ),
              const SizedBox(width: 4),
              Text(
                session.time,
                style: const TextStyle(
                  color: Color(0xFF6E6B8A),
                  fontSize: 9.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
