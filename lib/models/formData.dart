class FormData {
    String firstName;
    String lastName;

    FormData({this.firstName, this.lastName});

    factory FormData.fromJson(Map<String, dynamic> json) {
        return FormData(
            firstName: json['firstName'], 
            lastName: json['lastName'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['firstName'] = this.firstName;
        data['lastName'] = this.lastName;
        return data;
    }
}