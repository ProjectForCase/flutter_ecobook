import 'package:flutter/material.dart';
import '../models/member.dart';
import '../pages/member_detail_page.dart';

class MemberTile extends StatelessWidget {
  final Member member;

  const MemberTile({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MemberDetailPage(member: member),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(member.image),
            radius: 25,
          ),
          title: Text(member.name),
          subtitle: Text(member.realname),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}