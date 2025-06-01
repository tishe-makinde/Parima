import 'package:flutter/material.dart';
import 'package:parima/pages/forum/forum_select_tag.dart';

class ForumTagSelector extends StatelessWidget {
  const ForumTagSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          SizedBox(
            width: 15,
          ),
          ForumSelectTag(
            iconData: Icons.card_giftcard,
            title: 'Newest',
          ),
          SizedBox(
            width: 15,
          ),
          ForumSelectTag(
            iconData: Icons.people,
            title: 'Popular',
          ),
          SizedBox(
            width: 15,
          ),
          ForumSelectTag(
            iconData: Icons.thumb_up_sharp,
            title: 'Liked',
          ),
          SizedBox(
            width: 15,
          ),
          ForumSelectTag(title: 'Sweet'),
          SizedBox(
            width: 15,
          ),
          ForumSelectTag(title: 'Vegetarian'),
          SizedBox(
            width: 15,
          ),
          ForumSelectTag(title: 'Breakfast'),
          SizedBox(
            width: 15,
          ),
          ForumSelectTag(title: 'Lunch'),
          SizedBox(
            width: 15,
          ),
          ForumSelectTag(title: 'Dinner'),
        ],
      ),
    );
  }
}
