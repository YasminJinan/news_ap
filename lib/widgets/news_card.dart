import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String author;
  final String time;
  final Color color;
  final VoidCallback onTap;

  const NewsCard({super.key, required this.title, required this.author, required this.time, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
            ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              ),
              SizedBox(height: 10,),
              Text('Published by $author • $time',
              style: TextStyle(fontSize: 13, color: Colors.black54),
              )
            ],
          ),
        ),
    );
  }
}
