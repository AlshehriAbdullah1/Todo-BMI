import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.name,
    required this.job,
  }) : super(key: key);
  final String name, job;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        "${name}",
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        '${job}',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
