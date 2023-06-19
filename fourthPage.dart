import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  List<Map<String, String>> posts = [];
  Map<String, List<String>> comments = {};

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  void addPost() {
    String title = titleController.text;
    String body = bodyController.text;
    if (title.isNotEmpty && body.isNotEmpty) {
      setState(() {
        posts.add({
          'title': title,
          'body': body,
        });
      });
      titleController.clear();
      bodyController.clear();
    }
  }

  void addComment(String post, String comment) {
    if (comment.isNotEmpty) {
      setState(() {
        if (!comments.containsKey(post)) {
          comments[post] = [];
        }
        comments[post]!.add(comment);
      });
      commentController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.0),
            Text(
              'Community',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  Map<String, String> post = posts[index];
                  String postTitle = post['title']!;
                  String postBody = post['body']!;
                  List<String> postComments = comments[postTitle] ?? [];
                  return Card(
                    margin: EdgeInsets.only(bottom: 16.0),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            postTitle,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(postBody),
                          SizedBox(height: 8.0),
                          Divider(color: Colors.grey[400]),
                          SizedBox(height: 8.0),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: postComments.length,
                            itemBuilder: (context, index) {
                              String comment = postComments[index];
                              return ListTile(
                                title: Text(comment),
                              );
                            },
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: commentController,
                                  decoration: InputDecoration(
                                    hintText: 'Write a comment',
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              ElevatedButton(
                                onPressed: () {
                                  addComment(postTitle, commentController.text);
                                },
                                child: Text('Comment'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Create a Post'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: 'Title',
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: bodyController,
                      decoration: InputDecoration(
                        hintText: 'Body',
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      addPost();
                      Navigator.pop(context);
                    },
                    child: Text('Post'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
