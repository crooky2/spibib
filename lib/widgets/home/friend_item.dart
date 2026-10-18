import 'package:flutter/material.dart';

class FriendItem extends StatelessWidget {
	const FriendItem({
		required this.name,
		required this.color,
		super.key,
	});

	final String name;
	final Color color;

	@override
	Widget build(BuildContext context) {
		return InkWell(
			onTap: () => debugPrint('$name profile tapped'),
			borderRadius: BorderRadius.circular(12),
			child: Container(
				width: 75,
				margin: const EdgeInsets.symmetric(horizontal: 4),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						CircleAvatar(
							radius: 28,
							backgroundColor: color,
							child: Text(
								name[0],
								style: const TextStyle(
									color: Colors.white,
									fontSize: 20,
									fontWeight: FontWeight.bold,
								),
							),
						),
						const SizedBox(height: 6),
						Text(
							name,
							overflow: TextOverflow.ellipsis,
							style: const TextStyle(fontWeight: FontWeight.w500),
						),
					],
				),
			),
		);
	}
}
