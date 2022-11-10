import 'package:esport/Provider/crud_provider.dart';
import 'package:esport/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../show_detail.dart';


class play extends ConsumerWidget {


  @override
  Widget build(BuildContext context, ref) {
    final postData = ref.watch(postsStream);
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[200],
        title: Text(
          'Game List',
          style: TextStyle(
            fontSize: 35,color: Colors.black,fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: postData.when(
            data: (data){
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index){
                    return   Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.purple[200],
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  data[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          data[index].label,
                                          style: TextStyle(fontSize: 22, color: Colors.black),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(
                                          'Participants: ${data[index].Participants.length}',
                                          style: TextStyle(fontSize: 17, color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      TextButton(onPressed: (){
                                        Get.to(() => RegisterPage(data[index].Participants, data[index].id), transition: Transition.leftToRight);
                                      }, child: Text('Register', style: TextStyle(color: Colors.pink),)),
                                      TextButton(onPressed: (){
                                        Get.to(() => ShowDetail(data[index].Participants), transition: Transition.leftToRight);
                                      }, child: Text('show detail', style: TextStyle(color: Colors.black),)),
                                    ],
                                  )

                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                  });
            },
            error: (err, stack) => Center(child: Text('$err')),
            loading: () => Center(child: CircularProgressIndicator())
        )
      )),
    );
  }
}
