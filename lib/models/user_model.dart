class UserModel {
  String data;

  UserModel (this.data);

  UserModel.fromJson(Map<String, dynamic> json) :
    data = json['data'];

}