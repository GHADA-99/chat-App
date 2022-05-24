import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/chatUser.dart';
//contain database functions

class DatabaseUtils{
 CollectionReference<ChatUser>getUseCollection(){
  return
  FirebaseFirestore.instance.
  collection(ChatUser.collectionName).
  withConverter(fromFirestore: (
      snapshot,SnapshotOptions)=>ChatUser.fromJson(snapshot.data()!),
      toFirestore:(user,_)=> user.toJson());
 }
 //doc " create new document  "
 //calling it after check authentication
 Future<void> createUser(ChatUser user){
  return
  getUseCollection().
  doc(user.id).
  set(user);
 }

 Future<ChatUser?> getUser(String docId)async{
  var result =await getUseCollection().doc(docId).get();
 return result.data();
 }
}