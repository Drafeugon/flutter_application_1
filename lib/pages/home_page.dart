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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(tweet.profilePictureUrl),
      ),
      title: Row(
        children: [
          Text(tweet.name, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 5),
          if (tweet.verified == 'true')
            Icon(Icons.check_circle, color: Colors.blue, size: 16),
          SizedBox(width: 5),
          Text(tweet.handle, style: TextStyle(color: Colors.grey)),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tweet.content),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.comment, size: 16, color: Colors.grey),
              SizedBox(width: 5),
              Text(tweet.comments, style: TextStyle(color: Colors.grey)),
              SizedBox(width: 15),
              Icon(Icons.repeat, size: 16, color: Colors.grey),
              SizedBox(width: 5),
              Text(tweet.retweets, style: TextStyle(color: Colors.grey)),
              SizedBox(width: 15),
              Icon(Icons.favorite, size: 16, color: Colors.grey),
              SizedBox(width: 5),
              Text(tweet.likes, style: TextStyle(color: Colors.grey)),
              SizedBox(width: 15),
              Icon(Icons.remove_red_eye, size: 16, color: Colors.grey),
              SizedBox(width: 5),
              Text(tweet.views, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}