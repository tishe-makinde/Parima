import 'package:flutter/material.dart';
import 'package:parima/components/main_floating_action_button.dart';
import 'package:parima/models/forum_post.dart';
import 'package:parima/pages/forum/create_forum_post_page.dart';
import 'package:parima/pages/forum/forum_post_card.dart';
import 'package:parima/pages/forum/forum_tag_selector.dart';

class ForumsPage extends StatelessWidget {
  ForumsPage({super.key});

  final forumPosts = [
    ForumPost(
      imageUrl:
          'https://www.tasteofhome.com/wp-content/uploads/2018/01/Balsamic-Salmon-Spinach-Salad_EXPS_SDJJ19_47690_C02_05_5b-5.jpg?fit=700,700',
      title: 'Balsamic-Salmon Spinach Salad',
      tags: [
        'Vegan',
        'Quick',
      ],
      author: 'Arnold Schwarzenegger',
      authorAvatarUrl:
          'https://hips.hearstapps.com/hmg-prod/images/mh-10-10-arnold-65256f33e91ae.jpg?crop=0.442xw:0.885xh;0,0&resize=1200:*',
      likes: 2778,
      dislikes: 302,
      comments: 64,
    ),
    ForumPost(
      imageUrl:
          'https://www.kitchensanctuary.com/wp-content/uploads/2020/04/Chicken-Fried-Rice-square-FS-.jpg',
      title: 'Protein Rice Chicken',
      tags: [
        'High Protein',
        'Dinner',
      ],
      author: 'David Goggins',
      authorAvatarUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3F9iby1HmJDQ5FlkKx3tuqi_iq1RbmcyWqA&s',
      likes: 1342,
      dislikes: 654,
      comments: 320,
    ),
    ForumPost(
      imageUrl:
          'https://img.taste.com.au/nQKowE3y/taste/2018/02/granola-pancakes-135370-1.jpg',
      title: 'Protein Pancakes',
      tags: ['High Protein', 'Vegan', 'Egg', 'Breakfast'],
      author: 'Larry Wheels',
      authorAvatarUrl:
          'https://i.pinimg.com/474x/bd/24/60/bd2460ac4bc99fb0f7f8d3911fc19e5d.jpg',
      likes: 432,
      dislikes: 79,
      comments: 11,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // const SizedBox(
          //   height: 15,
          // ),
          // Sort Posts
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(
          //     color: Theme.of(context).colorScheme.surface,
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: SingleChildScrollView(
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Row(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Expanded(
          //             flex: 7,
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 color:
          //                     Theme.of(context).colorScheme.surfaceBright,
          //                 borderRadius: BorderRadius.circular(10),
          //               ),
          //               child: Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Icon(
          //                       Icons.new_releases,
          //                       color:
          //                           Theme.of(context).colorScheme.secondary,
          //                     ),
          //                     const SizedBox(
          //                       width: 5,
          //                     ),
          //                     Text(
          //                       'Newest',
          //                       style:
          //                           Theme.of(context).textTheme.titleSmall,
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //           const SizedBox(
          //             width: 8,
          //           ),
          //           Expanded(
          //             flex: 7,
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 color:
          //                     Theme.of(context).colorScheme.surfaceBright,
          //                 borderRadius: BorderRadius.circular(10),
          //               ),
          //               child: Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Icon(
          //                       Icons.group,
          //                       color:
          //                           Theme.of(context).colorScheme.secondary,
          //                     ),
          //                     const SizedBox(
          //                       width: 5,
          //                     ),
          //                     Text(
          //                       'Popular',
          //                       style:
          //                           Theme.of(context).textTheme.titleSmall,
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //           const SizedBox(
          //             width: 8,
          //           ),
          //           Expanded(
          //             flex: 8,
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 color:
          //                     Theme.of(context).colorScheme.surfaceBright,
          //                 borderRadius: BorderRadius.circular(10),
          //               ),
          //               child: Row(
          //                 children: [
          //                   Expanded(
          //                     child: Padding(
          //                       padding: const EdgeInsets.symmetric(
          //                           horizontal: 8.0),
          //                       child: Row(
          //                         mainAxisAlignment:
          //                             MainAxisAlignment.center,
          //                         children: [
          //                           const Icon(
          //                             Icons.favorite_rounded,
          //                           ),
          //                           const SizedBox(
          //                             width: 5,
          //                           ),
          //                           Text(
          //                             'Liked',
          //                             style: Theme.of(context)
          //                                 .textTheme
          //                                 .titleSmall,
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                   Container(
          //                     decoration: BoxDecoration(
          //                         color: Theme.of(context)
          //                             .colorScheme
          //                             .secondary,
          //                         borderRadius: const BorderRadius.only(
          //                           topRight: Radius.circular(10),
          //                           bottomRight: Radius.circular(10),
          //                         )),
          //                     child: Padding(
          //                       padding: const EdgeInsets.all(8.0),
          //                       child: Text(
          //                         '24',
          //                         style: Theme.of(context)
          //                             .textTheme
          //                             .titleSmall!
          //                             .copyWith(
          //                               color: Colors.white,
          //                             ),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          const ForumTagSelector(),

          // const SizedBox(
          //   height: 15,
          // ),
          // Container(
          //   height: 75,
          //   decoration: BoxDecoration(
          //     color: Theme.of(context).colorScheme.surface,
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(10.0),
          //     child: Row(
          //       children: [
          //         const CircleAvatar(
          //           backgroundImage:
          //               AssetImage('assets/images/therock.png'),
          //         ),
          //         const SizedBox(
          //           width: 10,
          //         ),
          //         Expanded(
          //           child: Container(
          //             decoration: BoxDecoration(
          //               color: Theme.of(context).colorScheme.surfaceBright,
          //               borderRadius: BorderRadius.circular(10),
          //             ),
          //             child: Padding(
          //               padding:
          //                   const EdgeInsets.symmetric(horizontal: 8.0),
          //               child: TextField(
          //                 decoration: const InputDecoration(
          //                   enabledBorder: InputBorder.none,
          //                   focusedBorder: InputBorder.none,
          //                   hintText: 'Let\'s share what going on...',
          //                 ),
          //                 style: Theme.of(context).textTheme.titleMedium,
          //               ),
          //             ),
          //           ),
          //         ),
          //         const SizedBox(
          //           width: 10,
          //         ),
          //         Container(
          //           decoration: BoxDecoration(
          //             color: Theme.of(context)
          //                 .colorScheme
          //                 .primary
          //                 .withOpacity(0.5),
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: const Padding(
          //             padding: EdgeInsets.all(12.5),
          //             child: Icon(
          //               Icons.send,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 15,
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ForumPostCard(
                      foodImageUrl: forumPosts[index].imageUrl,
                      authorImageUrl: forumPosts[index].authorAvatarUrl,
                      author: forumPosts[index].author,
                      title: forumPosts[index].title,
                      tags: forumPosts[index].tags,
                      likes: forumPosts[index].likes,
                      dislikes: forumPosts[index].dislikes,
                      comments: forumPosts[index].comments,
                    ),
                  );
                },
                itemCount: forumPosts.length,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: MainFloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateForumPostPage(),
            ),
          );
        },
        icon: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
