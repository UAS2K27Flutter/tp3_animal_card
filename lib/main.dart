
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimalCardApp());
}

class AnimalCardApp extends StatelessWidget {
  const AnimalCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon animal favori',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3F8FC),
        useMaterial3: true,
      ),
      home: const AnimalCardPage(),
    );
  }
}

class AnimalCardPage extends StatelessWidget {
  const AnimalCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon animal favori'),
        centerTitle: true,
        backgroundColor: const Color(0xFFE1F0FA),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 380),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withValues(alpha: 0.15),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba'
                    '?auto=format&fit=crop&w=900&q=80',
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 220,
                        color: const Color(0xFFE1F0FA),
                        child: const Center(
                          child: Icon(
                            Icons.pets,
                            size: 80,
                            color: Colors.blueGrey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Le chat',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF244A68),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Un compagnon doux, curieux et indépendant, '
                        'apprécié pour son intelligence et son affection.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: Color(0xFF596875),
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Divider(color: Color(0xFFD9E6EF)),
                      const SizedBox(height: 14),
                      const Row(
                        children: [
                          Expanded(
                            child: InfoItem(
                              icon: Icons.public,
                              label: 'Origine',
                              value: 'Monde entier',
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: InfoItem(
                              icon: Icons.home_outlined,
                              label: 'Habitat',
                              value: 'Maison',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Le saviez-vous ?'),
                                content: const Text(
                                  'Le chat possède une excellente ouïe '
                                  'et utilise ses moustaches pour '
                                  'mieux percevoir son environnement.',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Fermer'),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(Icons.info_outline),
                          label: const Text('En savoir plus'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3979A8),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF3979A8), size: 24),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF244A68),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
