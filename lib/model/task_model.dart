import 'dart:convert';

List<TaskModel> taskModelFromJson(String str) =>
    List<TaskModel>.from(json.decode(str).map((x) => TaskModel.fromJson(x)));

String taskModelToJson(List<TaskModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaskModel {
  TaskModel({
    this.id,
    this.title,
    this.createdAt,
  });

  int id;
  String title;
  DateTime createdAt;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "createdAt": createdAt.toIso8601String(),
      };
}
