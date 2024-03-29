class messageModel {
  final String message;
  final String sender;
  final String date ;
  messageModel( {required this.message, required this.sender , required this.date });

  factory messageModel.fromJson(json) {
    return messageModel(message: json['messages'], sender: json['sender'] , date: json['date'] );
  }
}
