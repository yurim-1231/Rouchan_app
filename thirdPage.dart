import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  bool isExerciseButtonPressed = false;
  bool isDiaryButtonPressed = false;
  bool isAddButtonVisible = false;
  List<String> selectedExercises = [];

  String diaryTitle = '';
  String diaryContent = '';

  Future<void> _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // Process the captured image
    }
  }

  void _toggleAddButton() {
    setState(() {
      isAddButtonVisible = !isAddButtonVisible;
    });
  }

  void _selectExercise(String exercise) {
    setState(() {
      if (selectedExercises.contains(exercise)) {
        selectedExercises.remove(exercise);
      } else {
        selectedExercises.add(exercise);
      }
    });
  }

  void _saveDiary() {
    // Save the diary entry
    // diaryTitle and diaryContent variables can be used here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16.0, top: 64.0),
              child: IconButton(
                onPressed: _takePicture,
                icon: Icon(Icons.camera_alt_rounded),
                color: Colors.white,
                iconSize: 48.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              child: Divider(
                color: Colors.grey[400],
                thickness: 2.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isExerciseButtonPressed = true;
                        isDiaryButtonPressed = false;
                      });
                    },
                    child: Text(
                      '운동 기록',
                      style: TextStyle(
                        color: isExerciseButtonPressed ? Colors.black : Colors.grey,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0.0,
                    ),
                  ),
                ),
                Container(
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isExerciseButtonPressed = false;
                        isDiaryButtonPressed = true;
                      });
                    },
                    child: Text(
                      '하루 일기',
                      style: TextStyle(
                        color: isDiaryButtonPressed ? Colors.black : Colors.grey,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0.0,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Divider(
                color: Colors.grey[400],
                thickness: 2.0,
              ),
            ),
            if (isExerciseButtonPressed)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  Text(
                    'Choose Exercises',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            onPressed: () => _selectExercise('데드리프트'),
                            child: Text(
                              '데드리프트',
                              style: TextStyle(
                                color: selectedExercises.contains('데드리프트')
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0.0,
                              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                  color: selectedExercises.contains('데드리프트')
                                      ? Colors.black
                                      : Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            onPressed: () => _selectExercise('랫 풀 다운'),
                            child: Text(
                              '랫 풀 다운',
                              style: TextStyle(
                                color: selectedExercises.contains('랫 풀 다운')
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0.0,
                              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                  color: selectedExercises.contains('랫 풀 다운')
                                      ? Colors.black
                                      : Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            onPressed: () => _selectExercise('벤치 프레스'),
                            child: Text(
                              '벤치 프레스',
                              style: TextStyle(
                                color: selectedExercises.contains('벤치 프레스')
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0.0,
                              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                  color: selectedExercises.contains('벤치 프레스')
                                      ? Colors.black
                                      : Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            onPressed: () => _selectExercise('스쿼트'),
                            child: Text(
                              '스쿼트',
                              style: TextStyle(
                                color: selectedExercises.contains('스쿼트')
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0.0,
                              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                  color: selectedExercises.contains('스쿼트')
                                      ? Colors.black
                                      : Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            onPressed: () => _selectExercise('레그 프레스'),
                            child: Text(
                              '레그 프레스',
                              style: TextStyle(
                                color: selectedExercises.contains('레그 프레스')
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0.0,
                              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                  color: selectedExercises.contains('레그 프레스')
                                      ? Colors.black
                                      : Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            onPressed: () => _selectExercise('스컬 크러셔'),
                            child: Text(
                              '스컬 크러셔',
                              style: TextStyle(
                                color: selectedExercises.contains('스컬 크러셔')
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0.0,
                              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                  color: selectedExercises.contains('스컬 크러셔')
                                      ? Colors.black
                                      : Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _toggleAddButton,
                    child: Icon(
                      isAddButtonVisible ? Icons.arrow_drop_down : Icons.add,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: CircleBorder(),
                    ),
                  ),
                  if (isAddButtonVisible)
                    Column(
                      children: [
                        Container(
                          height: 200.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: ListView.builder(
                            itemCount: selectedExercises.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(selectedExercises[index]),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 16.0),
                      ],
                    ),
                ],
              ),
            if (isDiaryButtonPressed)
              Column(
                children: [
                  SizedBox(height: 16.0),
                  Text(
                    'Write Diary',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Write Diary'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Title',
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      diaryTitle = value;
                                    });
                                  },
                                ),
                                SizedBox(height: 16.0),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Content',
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      diaryContent = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  _saveDiary();
                                  Navigator.of(context).pop();
                                },
                                child: Text('Save'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16.0),
                      primary: Colors.grey,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
