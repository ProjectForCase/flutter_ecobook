import 'package:flutter/material.dart';
import '../models/member.dart';

class MemberDetailPage extends StatelessWidget {
  final Member member;

  const MemberDetailPage({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
  length: 2,
  child: Scaffold(
    body: NestedScrollView(
      physics: const NeverScrollableScrollPhysics(),
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
  expandedHeight: 300,
  pinned: true,
  backgroundColor: Colors.indigo,

  title: Text(member.name),

  flexibleSpace: Stack(
  fit: StackFit.expand,
  children: [
    Image.network(
      member.image,
      fit: BoxFit.cover,
    ),
    Container(
      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.4), // 👈 關鍵
    ),
  ],
),

  bottom: const TabBar(
    tabs: [
      Tab(text: '介紹',),
      Tab(text: '偏好'),
    ],
  ),
)
        ];
      },

      body: TabBarView(
        children: [
          _buildInfoTab(),
          _buildPreferenceTab(),
        ],
      ),
    ),
  ),
);
  }

  Widget _buildInfoTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(member.description),
          ),
        ),
      ),
    );
  }

  Widget _buildPreferenceTab() {
    final items = [
      {
        'label': '喜歡',
        'value': member.suki,
        'color': Colors.green.shade50,
        'icon': Icons.favorite,
      },
      {
        'label': '討厭',
        'value': member.kirai,
        'color': Colors.red.shade50,
        'icon': Icons.heart_broken,
      },
      {
        'label': '生日',
        'value': member.birthday,
        'color': Colors.blue.shade50,
        'icon': Icons.cake,
      },
      {
        'label': '星座',
        'value': member.zodiac,
        'color': Colors.purple.shade50,
        'icon': Icons.star,
      },
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            elevation: 4,
            color: item['color'] as Color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(item['icon'] as IconData, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item['label'] as String,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        item['value'] as String,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      ),
    );
  }
}