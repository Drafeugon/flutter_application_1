class Tweet {
  final String  name;
  final String  handle;
  final String verified;
  final DateTime time;
  final String content;
  final String comments;
  final String retweets;
  final String likes;
  final String views;
  final String profilePictureUrl;
  static final List<Tweet> sampleTweets = [
    Tweet(
      name: 'John Doe',
      handle: '@johndoe',
      verified: 'true',
      time: DateTime.now().subtract(const Duration(minutes: 5)),
      content: 'This is a sample tweet content.ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt',
      comments: '10',
      retweets: '5',
      likes: '20',
      views: '100',
      profilePictureUrl: 'asset/blank-profile-picture.png',
    ),
    Tweet(
      name: 'Jane Smith',
      handle: '@janesmith',
      verified: 'false',
      time: DateTime.now().subtract(const Duration(hours: 1)),
      content: 'Another sample tweet content.',
      comments: '15',
      retweets: '8',
      likes: '30',
      views: '200',
      profilePictureUrl: 'asset/blank-profile-picture.png',
    ),
  ];

  Tweet({
    required this.name,
    required this.handle,
    required this.verified,
    required this.time,
    required this.content,
    required this.comments,
    required this.retweets,
    required this.likes,
    required this.views,
    required this.profilePictureUrl,
  });
}