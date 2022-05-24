class ChatUser{
  static const String collectionName ='user-collection';
  String id;
  String userName;
  String fName;
  String lName;
  String email;
  ChatUser({
    required this.id,
    required this.userName,
    required this.fName,
    required this.lName,
    required this.email});
  ChatUser.fromJson(Map<String,dynamic>json):
    this(
        id: json['id'] as String,
        userName: json['userName'] as String ,
        fName: json['fName'] as String,
        lName: json['lName'] as String,
        email: json['email'] as String
      );


   Map<String,dynamic>toJson(){
     return {
      ' id':id,
       'userName':userName,
       'fName':fName,
       'lName':lName,
       'email':email
     };

   }

}