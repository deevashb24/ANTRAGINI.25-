import 'package:flutter/material.dart';

class AntaragniJourneyPage extends StatelessWidget {
  const AntaragniJourneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> journeyData = [
      {
        "year": "1965",
        "desc": "Started under the name of Culfest and later renamed to Antaragni 1993"
      },
      {
        "year": "1988",
        "desc": "The now legendary rock metal band competition began under the name Synchronicity"
      },
      {
        "year": "2007",
        "desc": "Poets of the fall headlined the Rock Night (Now Synchronicity Night)"
      },
      {
        "year": "2010",
        "desc": "Parikrama headlined Synchronicity with an electrifying performance."
      },
      {
        "year": "2014",
        "desc": "Another milestone year in Antaragni's journey."
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Antaragni’s Journey"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemCount: journeyData.length,
        itemBuilder: (context, index) {
          final item = journeyData[index];
          final isLast = index == journeyData.length - 1;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline with dots + line
              Column(
                children: [
                  // Dot
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white,
                    ),
                  ),
                  // Line (except last item)
                  if (!isLast)
                    Container(
                      width: 2,
                      height: 80,
                      color: Colors.black,
                    ),
                ],
              ),
              const SizedBox(width: 12),

              // Year + Description card
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: index == 2
                        ? Colors.grey.shade700
                        : Colors.grey.shade200, // highlight 2007
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['year']!,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: index == 2 ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item['desc']!,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.4,
                          color: index == 2 ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}