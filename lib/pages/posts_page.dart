// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:trilhaapp/model/post_model.dart';
import 'package:trilhaapp/pages/comments_page.dart';
import 'package:trilhaapp/repositories/posts_repository.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  var postsRepository = PostsRepository();
  var posts = <PostModel>[];

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    posts = await postsRepository.getPosts();
    print(posts);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (_, index) {
            var post = posts[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CommentsPage(postId: post.id)));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Card(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          post.body,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    ));
  }
}
