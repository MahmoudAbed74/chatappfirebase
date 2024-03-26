class messageModel {
  final String message;
  messageModel({required this.message});

  factory messageModel.fromJson(json) {
    return messageModel(message: json['message']);
  }
}
