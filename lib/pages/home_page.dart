import 'package:flutter/material.dart';
import 'package:flutter_application_1/tweet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: Image.asset('asset/logo-twitter-noir.png', height: 30),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        leading: CircleAvatar(
          backgroundImage: AssetImage('asset/blank-profile-picture.png'),
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: Tweet.sampleTweets.length,
                  itemBuilder: (context, index) {
                    final tweet = Tweet.sampleTweets[index];
                    return _TweetWidget(tweet: tweet);
                  },
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    tooltip: 'Accueil',
                    icon: const Icon(Icons.home),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/research');
                    },
                    tooltip: 'Recherche',
                    icon: const Icon(Icons.search),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/community');
                    },
                    tooltip: 'Communauté',
                    icon: const Icon(Icons.group),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/notifications');
                    },
                    tooltip: 'Notifications',
                    icon: const Icon(Icons.notifications),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/messages');
                    },
                    tooltip: 'Messages',
                    icon: const Icon(Icons.mail),
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TweetWidget extends StatelessWidget {
  final Tweet tweet;

  const _TweetWidget({required this.tweet});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 8),
            child: CircleAvatar(
              backgroundImage: AssetImage(tweet.profilePictureUrl),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 5,
                    children: [
                      Text(
                        tweet.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (tweet.verified == 'true')
                        const Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                          size: 16,
                        ),
                      Text(
                        tweet.handle,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    tweet.content,
                    softWrap: true,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _TweetMetric(
                        icon: Icons.comment,
                        value: tweet.comments,
                      ),
                      _TweetMetric(
                        icon: Icons.repeat,
                        value: tweet.retweets,
                      ),
                      _TweetMetric(
                        icon: Icons.favorite,
                        value: tweet.likes,
                      ),
                      _TweetMetric(
                        icon: Icons.remove_red_eye,
                        value: tweet.views,
                      ),
                    ].map((metric) => Expanded(child: metric)).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TweetMetric extends StatelessWidget {
  final IconData icon;
  final String value;

  const _TweetMetric({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            value,
            style: const TextStyle(color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
