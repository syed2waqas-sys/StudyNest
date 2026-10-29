import 'package:assignment_project/main_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:assignment_project/utils/app_assets.dart';

class SigningInScreen extends StatefulWidget {
  const SigningInScreen({super.key});

  @override
  State<SigningInScreen> createState() => _SigningInScreenState();
}

class _SigningInScreenState extends State<SigningInScreen> {
  @override
  void initState() {
    super.initState();
    openHome();
  }

  Future<void> openHome() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    SizedBox(
                      width: 167.49,
                      height: 93.12,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 42.12,
                            height: 42.12,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Color(0xFF6964C4),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppAssets.appLogo,
                                  width: 21.06,
                                  height: 21.06,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 6),

                          const Text(
                            'StudyNest',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Subtitle
                    const Text(
                      'Welcome back! Plan your study sessions and\n'
                      'stay on track.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFD6D2FF),
                        fontSize: 10,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Email field
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'tabas@studynest.app',
                        hintStyle: const TextStyle(fontSize: 12),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 13,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 9),

                    // Password field
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '123456',
                        hintStyle: const TextStyle(fontSize: 12),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 13,
                        ),
                        suffixIcon: const Icon(
                          Icons.visibility_off,
                          size: 17,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    // Forgot password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Signing in button
                    SizedBox(
                      width: double.infinity,
                      height: 42,
                      child: ElevatedButton(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                          disabledBackgroundColor:
                              const Color(0xFFE6A343),
                          disabledForegroundColor:
                              const Color(0xFF8A6A3D),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 12,
                              width: 12,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                                color: Color(0xFF8A6A3D),
                              ),
                            ),
                            SizedBox(width: 7),
                            Text(
                              'Signing in...',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Sign up
                    TextButton(
                      onPressed: () {},
                      child: const Text.rich(
                        TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          children: [
                            TextSpan(text: 'New here? '),
                            TextSpan(
                              text: 'Sign up',
                              style: TextStyle(
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
            ),
          ),
        ),
      ),
    );
  }
}