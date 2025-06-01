import 'package:flutter/material.dart';

class ForumPostCard extends StatefulWidget {
  const ForumPostCard({
    super.key,
    required this.foodImageUrl,
    required this.authorImageUrl,
    required this.author,
    required this.title,
    required this.tags,
    required this.likes,
    required this.dislikes,
    required this.comments,
  });

  final String foodImageUrl;
  final String authorImageUrl;
  final String author;
  final String title;
  final List<String> tags;

  final int likes;
  final int dislikes;
  final int comments;

  @override
  State<ForumPostCard> createState() => _ForumPostCardState();
}

class _ForumPostCardState extends State<ForumPostCard> {
  int likes = 0;
  int dislikes = 0;

  var liked = false;

  var disliked = false;

  @override
  void initState() {
    super.initState();
    likes = widget.likes;
    dislikes = widget.dislikes;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceBright,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: SizedBox(
              height: 125,
              width: MediaQuery.sizeOf(context).width,
              child: Image.network(
                widget.foodImageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          // Avatar Title Tags Author
          Expanded(
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    widget.authorImageUrl,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width - 150,
                      child: Text(
                        widget.title,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 0,
                      children: List.generate(
                        widget.tags.length > 3 ? 3 : widget.tags.length,
                        (tagIndex) {
                          return Chip(
                            label: Text(
                              widget.tags[tagIndex],
                            ),
                            labelStyle:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                            labelPadding: const EdgeInsets.symmetric(
                              horizontal: 3,
                            ),
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.5),
                            side: BorderSide.none,
                          );
                        },
                      ),
                    ),
                    Text(
                      widget.author,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Likes Dislikes Comments
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(
                              () {
                                liked = !liked;

                                if (liked) {
                                  likes++;
                                  if (disliked) {
                                    disliked = !disliked;
                                    dislikes--;
                                  }
                                } else {
                                  likes--;
                                }
                              },
                            );
                          },
                          icon: const Icon(Icons.thumb_up_sharp),
                          color: liked ? Colors.green[400] : Colors.white),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        likes.toString(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: liked ? Colors.green[400] : Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            disliked = !disliked;

                            if (disliked) {
                              dislikes++;
                              if (liked) {
                                liked = !liked;
                                likes--;
                              }
                            } else {
                              dislikes--;
                            }
                          });
                        },
                        icon: const Icon(Icons.thumb_down),
                        color: disliked ? Colors.red[400] : Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        dislikes.toString(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: disliked ? Colors.red[400] : Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Icons.comment),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        widget.comments.toString(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
