class UserModel {
  final User? user;
  final int? taskCompleted;

  UserModel({
    this.user,
    this.taskCompleted,
  });

  UserModel.fromJson(Map<String, dynamic> json)
    : user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null,
      taskCompleted = json['task_completed'] as int?;

  Map<String, dynamic> toJson() => {
    'user' : user?.toJson(),
    'task_completed' : taskCompleted
  };
}

class User {
  final int? id;
  final String? name;
  final String? email;

  User({
    this.id,
    this.name,
    this.email,
  });

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      name = json['name'] as String?,
      email = json['email'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'email' : email
  };
}