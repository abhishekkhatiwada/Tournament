import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/game.dart';



final crudProvider = Provider((ref) => CrudProvider());
final postsStream = StreamProvider((ref) => CrudProvider().getPosts());

class CrudProvider{

  CollectionReference postDb = FirebaseFirestore.instance.collection('games');



  Stream<List<Game>> getPosts() {
    try{
      return postDb.snapshots().map((event) {
        return getPostData(event);
      });
    }on FirebaseException catch(err){
      throw '${err.message}';
    }

  }

  List<Game>getPostData(QuerySnapshot snapshot){
    return snapshot.docs.map((e){
      final json = e.data() as Map<String, dynamic>;
      return Game(
          id: e.id,
          imageUrl: json['imageurl'],
          label: json['label'],
          Participants: (json['Participants'] as List).map((e) => Party.fromJson(e)).toList()
      );
    }).toList();
  }




  Future<String> partyAdd({
    required String postId,
    required List<Party> parties
  }) async{
    try{
      final partiesData =parties.map((e) => e.toJson()).toList();
      await postDb.doc(postId).update({
        'Participants': FieldValue.arrayUnion(partiesData)
      });
      return 'success';
    }on FirebaseException catch(err){
      return '${err.message}';
    }

  }






}