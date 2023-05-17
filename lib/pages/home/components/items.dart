import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  final String fullName, shortName;
  final int stars, watchers, forks;

  const Items(
      {Key? key,
      required this.fullName,
      required this.shortName,
      required this.stars,
      required this.watchers,
      required this.forks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style:
                  TextStyle(color: Colors.blue[900], fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Short name: $shortName',
                  style: const TextStyle(
                      color: Colors.purple, fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Stars: $stars',
                  style:
                  const TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Watchers: $watchers',
                  style: const TextStyle(
                      color: Colors.green, fontSize: 12, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Forks: $forks',
                  style: const TextStyle(
                      color: Colors.pinkAccent, fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Icon(Icons.navigate_next)
        ],
      ),
    );
  }
}
