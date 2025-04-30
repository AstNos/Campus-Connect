import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';

class GroupCard extends StatelessWidget {
  final String name;
  final String subject;
  final String members;
  final VoidCallback onTap;

  const GroupCard({
    Key? key,
    required this.name,
    required this.subject,
    required this.members,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.paddingMedium, vertical: AppSizes.paddingSmall),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.cardRadius)),
      child: ListTile(
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Subject: $subject\nMembers: $members'),
        onTap: onTap,
      ),
    );
  }
}