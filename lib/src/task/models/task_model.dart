class Tasks {
  late int? id;
  late String? title;
  late String? description;
  late String? expirationDate;
  late int? userId;
  late String? status;

  Tasks({
    this.id,
    this.title,
    this.description,
    this.expirationDate,
    this.userId,
    this.status,
  });

  Tasks.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      title = json['title'] as String?,
      description = json['description'] as String?,
      expirationDate = json['expiration_date'] as String?,
      userId = json['user_id'] as int?,
      status = json['status'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'description' : description,
    'expiration_date' : expirationDate,
    'user_id' : userId,
    'status' : status
  };
}