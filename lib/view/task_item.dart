import 'package:flutter/material.dart';
import 'package:fonibo_test/model/task_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Tasks extends StatefulWidget {
  Tasks({Key key}) : super(key: key);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<Color> _colors = [
    Color(0xffFFDEDE),
    Color(0x915bb1f),
    Color(0xffB1F8C1),
    Color(0xffFEDEFF)
  ];

  List<TaskModel> _taskmodel = List();
  int selectedValue;

  @override
  void initState() {
    tasksResponse();
    selectedValue = 0;
    super.initState();
  }

  void setSelectedValue(int value) {
    setState(() {
      selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _taskmodel.length == 0
          ? Center(child: CircularProgressIndicator())
          : Container(
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: _taskmodel.length,
                itemBuilder: (BuildContext context, int index) {
                  DateTime now =
                      DateTime.parse(_taskmodel[index].createdAt.toString());
                  String formattedDate =
                      DateFormat('yyyy-MM-dd – kk:mm').format(now);
                  return Container(
                    margin: EdgeInsets.only(bottom: 8.0),
                    width: double.maxFinite,
                    height: 66.0,
                    child: Row(
                      children: [
                        Container(
                          width: 9.24,
                          height: 66.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: _colors[index],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 52,
                          height: 66.0,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xffF8F8F8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 18),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _taskmodel[index].title,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff333232)),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        formattedDate,
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Color(0xff4E4E4E)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Radio(
                                groupValue: selectedValue,
                                onChanged: (int value) {
                                  setSelectedValue(value);
                                },
                                value: index + 1,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }

  Future<void> tasksResponse() async {
    var url =
        'https://cdn.fonibo.com/challenges/tasks.json?fbclid=IwAR2_p4l-V2C7nulQVTShYHIcPRbqywiGcAfqaDuWbLSY2Se2YHeTk7_NOIw';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        _taskmodel = taskModelFromJson(response.body);
      });
    }
  }
}
