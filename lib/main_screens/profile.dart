
import 'package:flutter/material.dart';
import 'package:assignment_project/model/study_session.dart';
import 'package:assignment_project/data/study_sessions.dart';
import 'package:assignment_project/main_screens/login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final total = studySessions.length;

    final pending = studySessions
        .where((session) => session.status == SessionStatus.pending)
        .length;

    final done = studySessions
        .where((session) => session.status == SessionStatus.done)
        .length;

    final completionRate =
        total == 0 ? 0 : ((done / total) * 100).round();

    final pendingSessions = studySessions
        .where((session) => session.status == SessionStatus.pending)
        .toList();

    final nextSession = pendingSessions.isEmpty
        ? 'No upcoming sessions'
        : pendingSessions.first.title;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F5FC),
      body: SafeArea(
        child: Column(
          children: [
            // Profile Header
            SizedBox(
              height: 195,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Gradient Background
                  Container(
                    height: 158,
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
                  ),

                  // User Information
                  Positioned(
                    top: 30,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Container(
                          height: 54,
                          width: 54,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF2A93B),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'TS',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF29235A),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Taba Saleh',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          'taba@studynest.app',
                          style: TextStyle(
                            color: Color(0xFFD6D2FF),
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Dynamic Statistics
                  Positioned(
                    top: 139,
                    left: 12,
                    right: 12,
                    child: Row(
                      children: [
                        Expanded(
                          child: _statCard(
                            total.toString(),
                            'Total',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _statCard(
                            pending.toString(),
                            'Pending',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _statCard(
                            done.toString(),
                            'Done',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Profile Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
                  _infoRow('Next session', nextSession),
                  const SizedBox(height: 10),
                  _infoRow('Completion rate', '$completionRate%'),
                  const SizedBox(height: 10),
                  _infoRow('Member since', 'Sep 2026'),
                  const SizedBox(height: 18),

                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    height: 36,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      icon: const Icon(
                        Icons.logout,
                        size: 16,
                      ),
                      label: const Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF5149A8),
                        side: const BorderSide(
                          color: Color(0xFF5149A8),
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Bottom Navigation
            Container(
              height: 48,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_outlined,
                            size: 18,
                            color: Color(0xFF7776A8),
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 9,
                              color: Color(0xFF7776A8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 18,
                            color: Color(0xFF5149A8),
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                              fontSize: 9,
                              color: Color(0xFF5149A8),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Statistics Card
  static Widget _statCard(String number, String title) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: const TextStyle(
              color: Color(0xFF5149A8),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF77768E),
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }

  // Profile Information Row
  static Widget _infoRow(String title, String value) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF85839B),
              fontSize: 10,
            ),
          ),
          const Spacer(),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF34334D),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
