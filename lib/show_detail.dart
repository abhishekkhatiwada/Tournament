import 'package:esport/Provider/crud_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/game.dart';


class ShowDetail extends ConsumerWidget {

  final List<Party> parties;
  ShowDetail(this.parties);
  @override
  Widget build(BuildContext context, ref) {
    final postData = ref.watch(postsStream);
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[200],
        title: Text(
          'Participant List',
          style: TextStyle(
              fontSize: 35,color: Colors.black,fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: parties.isEmpty ? Center(child: Text('There are no participants')): ListView.builder(
    itemCount: parties.length,
    itemBuilder: (context, index){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
              height: 200,
              width: 200,
              child: Image.network(parties[index].logo)),
          Text(parties[index].captain),
        ],
      );
    }
    )
    ));
  }
}
