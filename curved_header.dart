import 'package:flutter/material.dart';

class CurvedHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  const CurvedHeader({required this.title, required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedClipper(),
      child: Container(
        width: double.infinity,
        height: 220,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF805D), Color(0xFFFFA07A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 20,
              child: Icon(Icons.arrow_back, color: Colors.white, size: 28),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(subtitle,
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            // Decorative circles
            Positioned(
                top: 30,
                right: 40,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white.withOpacity(0.2),
                )),
            Positioned(
                top: 80,
                left: 60,
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.white.withOpacity(0.2),
                )),
            Positioned(
                top: 120,
                right: 80,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.white.withOpacity(0.2),
                )),
          ],
        ),
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
} 