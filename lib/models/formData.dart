class FormData {
  String firstName;
  String lastName;
  int requestId;

  FormData({this.requestId, this.firstName, this.lastName});

  factory FormData.fromJson(Map<String, dynamic> json) {
    return FormData(
      firstName: json['firstName'],
      lastName: json['lastName'],
      requestId: json['request_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['request_id'] = this.requestId;
    return data;
  }
}
