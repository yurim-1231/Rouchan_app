import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Memo {
  final DateTime date;
  final String content;

  Memo(this.date, this.content);
}

class FirstPage extends StatefulWidget {
  final double padding;
  final double textTopPadding;
  final double textBottomPadding;
  final double textLeftPadding;
  final double linePadding;
  final double fontSize;
  final double strokeWidth;

  FirstPage({
    this.padding = 0.0,
    this.textTopPadding = 64.0,
    this.textBottomPadding = 0.0,
    this.textLeftPadding = 16.0,
    this.linePadding = 0,
    this.fontSize = 24.0,
    this.strokeWidth = 2.0,
  });

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int selectedButtonIndex = -1;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _selectedDay = DateTime.now();
  List<Memo> memos = [];
  bool showCalendarAndMemo = false;

  void viewMemo(String memo) {
    setState(() {
      // View memo functionality
    });
  }

  void addMemo(String memo) {
    setState(() {
      memos.add(Memo(_selectedDay, memo));
    });
    Navigator.pop(context); // Close the memo dialog
  }

  void openMemoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String memoContent = '';
        return AlertDialog(
          title: Text('Add Memo'),
          content: TextField(
            onChanged: (value) {
              memoContent = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter your memo',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the memo dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                addMemo(memoContent);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(widget.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: widget.textTopPadding,
                bottom: widget.textBottomPadding,
                left: widget.textLeftPadding,
              ),
              child: Text(
                '목표',
                style: TextStyle(
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(height: widget.linePadding),
            Opacity(
              opacity: 0.5,
              child: Divider(
                color: Colors.grey[400],
                thickness: widget.strokeWidth,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedButtonIndex = 0;
                      showCalendarAndMemo = false;
                    });
                  },
                  child: Container(
                    height: 50.0,
                    width: 100.0,
                    child: Center(
                      child: Text(
                        '전체 목표',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: selectedButtonIndex == 0 ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedButtonIndex = 1;
                      showCalendarAndMemo = true;
                    });
                  },
                  child: Container(
                    height: 50.0,
                    width: 100.0,
                    child: Center(
                      child: Text(
                        '오늘 실천',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: selectedButtonIndex == 1 ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: widget.linePadding),
            Opacity(
              opacity: 0.5,
              child: Divider(
                color: Colors.grey[400],
                thickness: widget.strokeWidth,
              ),
            ),
            SizedBox(height: 16.0),
            if (!showCalendarAndMemo)
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Memo',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: memos.length,
                        itemBuilder: (BuildContext context, int index) {
                          Memo memo = memos[index];
                          return Container(
                            padding: EdgeInsets.all(8.0),
                            margin: EdgeInsets.only(bottom: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ListTile(
                              title: Text(memo.content),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            if (showCalendarAndMemo) ...[
              TableCalendar(
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                  });
                },
                calendarStyle: CalendarStyle(
                  weekendTextStyle: TextStyle().copyWith(color: Colors.red),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                firstDay: DateTime.utc(2021, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: DateTime.now(),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekendStyle: TextStyle().copyWith(color: Colors.red),
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Memo',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: memos.length,
                        itemBuilder: (BuildContext context, int index) {
                          Memo memo = memos[index];
                          if (isSameDay(memo.date, _selectedDay)) {
                            return Container(
                              padding: EdgeInsets.all(8.0),
                              margin: EdgeInsets.only(bottom: 8.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: ListTile(
                                title: Text(memo.content),
                              ),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openMemoDialog,
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
