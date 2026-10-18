import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    required this.title,
    required this.description,
    required this.onTap,
    this.image,
    super.key,
  });

  final String title;
  final String description;
  final VoidCallback onTap;
  final ImageProvider<Object>? image;

  void _handleActions() {

  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 2),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: image == null
                        ? const ColoredBox(
                            color: Color(0xffdbeafe),
                            child: Icon(
                              Icons.videogame_asset_outlined,
                              color: Color(0xff1d4ed8),
                              size: 56,
                            ),
                          )
                        : Image(image: image!, fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Material(
                      color: const Color.fromARGB(40, 0, 0, 0),
                      shape: const CircleBorder(),
                      child: IconButton(
                        onPressed: _handleActions,
                        color: Colors.white,
                        icon: const Icon(Icons.more_vert),
                        tooltip: 'More actions',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(description, style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
