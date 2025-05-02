import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta/model/request_post_model.dart';
import 'package:insta/repository/post_repository.dart';
import 'package:insta/ui/const/route.dart';

class AddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddPageState();
  }
}

class _AddPageState extends State<AddPage> {
  XFile? image1;
  XFile? image2;
  XFile? image3;
  TextEditingController descController = TextEditingController();
  PostRepository _postRepository = PostRepository();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Добавить', style: TextStyle(fontSize: 24)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () async {
                  var img = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 50,
                  );
                  if (img != null) {
                    setState(() {
                      image1 = img;
                    });
                  }
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[300],
                  child: image1 != null ? Image.network(image1!.path) : null,
                ),
              ),
              InkWell(
                onTap: () async {
                  var img = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 50,
                  );
                  if (img != null) {
                    setState(() {
                      image2 = img;
                    });
                  }
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[300],
                  child: image2 != null ? Image.network(image2!.path) : null,
                ),
              ),
              InkWell(
                onTap: () async {
                  var img = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 50,
                  );
                  if (img != null) {
                    setState(() {
                      image3 = img;
                    });
                  }
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[300],
                  child: image3 != null ? Image.network(image3!.path) : null,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 12, 0, 12),
            color: Colors.grey[300],
            child: TextField(controller: descController, maxLines: 5),
          ),
          ElevatedButton(
            onPressed: () async {
              RequestPostModel post = RequestPostModel(
                image1: image1,
                image2: image2,
                image3: image3,
                user: FirebaseAuth.instance.currentUser!.uid,
                text: descController.text,
              );
              loading();
              await _postRepository.post(post);
              if (context.mounted) {
                MRoute.pop(context);
              }
              clear();
            },
            child: Text('post'),
          ),
        ],
      ),
    );
  }

  clear(){
    descController.clear();
    image1 = null;
    image2 = null;
    image3 = null;
    setState(() {});
  }

  loading() {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            color: Colors.white,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
