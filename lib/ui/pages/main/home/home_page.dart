import 'package:flutter/material.dart';
import 'package:insta/model/response_post_model.dart';
import 'package:insta/repository/post_repository.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ResponsePostModel> posts = [];
  PostRepository _repository = PostRepository();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData()async{
    posts = await _repository.getPosts();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(posts[index].text),
            if (posts[index].image1.isNotEmpty)
              Image.network(posts[index].image1),
          ],
        );
      },
    );
  }
}
