class ForumPost {
  final String imageUrl;
  final String title;
  final List<String> tags;
  final String author;
  final String authorAvatarUrl;

  final int likes;
  final int dislikes;
  final int comments;

  ForumPost({
    required this.imageUrl,
    required this.title,
    required this.tags,
    required this.author,
    required this.authorAvatarUrl,
    required this.likes,
    required this.dislikes,
    required this.comments,
  });
}
