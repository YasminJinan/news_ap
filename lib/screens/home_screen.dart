import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> _newsFuture;

  @override
  void initState() {
    super.initState();
    _newsFuture = NewsService.fetchTopHeadlines();
  }

  final pastelColors = [
    const Color(0xFFFFF6D6),
    const Color(0xFFFCE7F3),
    const Color(0xFFDFF6FF),
    const Color(0xFFE9FCE7),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      appBar: AppBar(
        title: Text(
          'Scope',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings_rounded, color: Colors.white,),
          )
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.white,),)
            
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          final articles = snapshot.data ?? [];
          return Padding(padding: EdgeInsets.symmetric(vertical: 16),
          child: Swiper(
            itemCount: articles.length,
            loop: true,
            viewportFraction: 0.9,
            scale: 0.95,
            itemBuilder: (context, index) {
              final article = articles[index];
              final color = pastelColors[index % pastelColors.length]
            },
          ),
          );
        }
      ),
    );
  }

}