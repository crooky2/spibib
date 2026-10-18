import 'package:flutter/material.dart';

import "../widgets/home/friend_item.dart";
import "../widgets/home/game_card.dart";
import "../widgets/general/section_card.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  bool _favoritesOnly = false;
  String _selectedFilter = 'All';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleGameTap() {
    debugPrint('Featured game tapped');
  }

  @override
  Widget build(BuildContext context) {
    final content = <Widget>[
      SectionCard(
        title: 'Friends',
        icon: Icons.group,
        action: () {
          debugPrint('Section card tapped');
        },
        children: [
          SizedBox(
            height: 105,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FriendItem(name: 'Alex', color: Colors.blue),
                FriendItem(name: 'Jamie', color: Colors.green),
                FriendItem(name: 'Taylor', color: Colors.orange),
                FriendItem(name: 'Morgan', color: Colors.purple),
                FriendItem(name: 'Riley', color: Colors.red),
              ],
            ),
          ),
        ],
      ),

      SizedBox(height: 6),

      Card(
        margin: const EdgeInsets.only(bottom: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: _searchController,
                    onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search, size: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 1,
                        vertical: 1,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                onPressed: () {
                  setState(() => _favoritesOnly = !_favoritesOnly);
                },
                icon: Icon(_favoritesOnly ? Icons.star : Icons.star_border),
                color: _favoritesOnly
                    ? Theme.of(context).colorScheme.primary
                    : null,
                tooltip: 'Show favorites only',
              ),
              DropdownButton<String>(
                value: _selectedFilter,
                underline: const SizedBox.shrink(),
                items: const [
                  DropdownMenuItem(value: 'All', child: Text('All')),
                  DropdownMenuItem(value: 'Recent', child: Text('Recent')),
                  DropdownMenuItem(value: 'Alphabetical', child: Text('A-Z')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedFilter = value);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      GameCard(
        title: 'Featured game',
        description: 'Discover a new adventure and start playing.',
        onTap: _handleGameTap,
      ),
      GameCard(
        title: 'Featured game',
        description: 'Discover a new adventure and start playing.',
        onTap: _handleGameTap,
      ),
      GameCard(
        title: 'Featured game',
        description: 'Discover a new adventure and start playing.',
        onTap: _handleGameTap,
      ),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: false,
            title: const Text('Home'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                icon: const Icon(Icons.settings),
                tooltip: 'Settings',
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                icon: const Icon(Icons.person),
                tooltip: 'Profile',
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            sliver: SliverList.separated(
              itemCount: content.length,
              itemBuilder: (context, index) => content[index],
              separatorBuilder: (context, index) => const SizedBox(height: 4),
            ),
          ),
        ],
      ),
    );
  }
}
