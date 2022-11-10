import 'dart:io';

import 'package:esport/Provider/authProvider.dart';
import 'package:esport/Provider/togglePage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'Provider/crud_provider.dart';
import 'models/game.dart';

class RegisterPage extends StatelessWidget {
  final List<Party> parties;
  final String id;
  RegisterPage(this.parties, this.id);
  final _form = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final capController = TextEditingController();
  final p1Controller = TextEditingController();
  final p2Controller = TextEditingController();
  final p3Controller = TextEditingController();
  final contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          title: Text('Esports',style: TextStyle(fontSize: 30),),
          centerTitle: true,
          backgroundColor: Colors.blue[200],
          elevation: 0,
        ),
        body: Consumer(builder: (context, ref, child) {
          final image = ref.watch(imageProvider);
          final isLoad = ref.watch(loadingProvider);
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Form(
                key: _form,
                child: ListView(
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(fontSize: 35,color: Colors.black),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                      TextFormField(
                        controller: nameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'please provide teamname';
                          } else if (val.length > 15) {
                            return 'maximum character is 15';
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: 'Teamname'),
                      ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'please provide captainname';
                        }
                        return null;
                      },
                      controller: capController,
                      decoration: InputDecoration(hintText: ' Captain Name'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'please provide player1';
                        }
                        return null;
                      },
                      controller: p1Controller,
                      decoration: InputDecoration(hintText: 'Player1'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: p2Controller,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'please provide player2';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: 'Player2'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: p3Controller,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'please provide player3';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: 'Player3'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: contactController,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'please provide contact';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: 'Contact'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                      InkWell(
                        onTap: () {
                          ref.read(imageProvider.notifier).imageSelect();
                        },
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          child: image == null
                              ? Center(child: Text('please select team logo'))
                              : Image.file(File(image.path)),
                        ),
                      ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          _form.currentState!.save();
                          //   print(mailController.text.replaceAll(RegExp(r"\s+"), " "));
                          if (_form.currentState!.validate()) {

                              if (image == null) {
                                Get.defaultDialog(
                                    title: 'image required',
                                    content: Text('please select an image'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('close'))
                                    ]);
                              } else {
                                ref.read(loadingProvider.notifier).toggle();
                                final imageId = DateTime.now().toString();
                                final st = FirebaseStorage.instance.ref().child('party/$imageId');
                                await st.putFile(File(image.path));
                                final url = await st.getDownloadURL();
                                final newParty = Party(
                                    logo: url,
                                    captain: capController.text.trim(),
                                    contact: int.parse(contactController.text.trim()),
                                    player1: p1Controller.text.trim(),
                                    player2: p2Controller.text.trim(),
                                    player3: p3Controller.text.trim(),
                                    teamName:nameController.text.trim()
                                );
                                parties.add(newParty);
                                final response = await ref
                                    .read(crudProvider).partyAdd(postId: id, parties: parties);
                                ref.read(loadingProvider.notifier).toggle();
                                if (response != 'success') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          duration:
                                          Duration(milliseconds: 1500),
                                          content: Text(response)));
                                }else{
                                  Get.back();
                                }
                              }
                            }

                        },
                        child:isLoad == true ? CircularProgressIndicator(
                          color: Colors.white,
                        ) :  Text('Submit')),
                    SizedBox(
                      height: 15,
                    ),

                  ],
                ),
              ),
            ),
          );
        }));
  }
}
