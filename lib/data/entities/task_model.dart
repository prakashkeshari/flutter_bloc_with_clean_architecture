class TaskListModel {
  List<TaskModel>? taskList;

  TaskListModel({this.taskList});
  TaskListModel.fromJson(Map<String, dynamic> json) {
    taskList = json[''];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[''] = this.taskList;
    return data;
  }
}

class TaskModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TaskModel({this.userId, this.id, this.title, this.completed});

  TaskModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }
}
