import 'dart:io';

import 'package:esport/Provider/authProvider.dart';
import 'package:esport/Provider/togglePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final passController = TextEditingController();

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
          final isLogin = ref.watch(loginProvider);
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
                      isLogin == true ? 'Login' : 'Sign Up',
                      style: TextStyle(fontSize: 35,color: Colors.black),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    if (isLogin == false)
                      TextFormField(
                        controller: nameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'please provide username';
                          } else if (val.length > 15) {
                            return 'maximum character is 15';
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: 'Username'),
                      ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'please provide username';
                        } else if (!val.contains('@')) {
                          return 'please provide valid email';
                        }
                        return null;
                      },
                      controller: mailController,
                      decoration: InputDecoration(hintText: 'Email'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'please provide username';
                        } else if (val.length > 15) {
                          return 'maximum character is 15';
                        }
                        return null;
                      },
                      controller: passController,
                      decoration: InputDecoration(hintText: 'Password'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    if (isLogin == false)
                      InkWell(
                        onTap: () {
                          ref.read(imageProvider.notifier).imageSelect();
                        },
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          child: image == null
                              ? Center(child: Text('please select an image'))
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
                            if (isLogin == true) {
                              ref.read(loadingProvider.notifier).toggle();
                              final response = await ref
                                  .read(authProvider)
                                  .userLogin(
                                      email: mailController.text.trim(),
                                      password: passController.text.trim());
                              ref.read(loadingProvider.notifier).toggle();

                              //anonymous login
                              // final response = await ref.read(authProvider).userLoginAnonymously();
                              if (response != 'success') {
                                // Get.defaultDialog(
                                //     title: 'some error occured',
                                //     content: Text(response),
                                //     actions: [
                                //       TextButton(onPressed: (){
                                //         Navigator.of(context).pop();
                                //       }, child: Text('close'))
                                //     ]
                                // );

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration: Duration(milliseconds: 1500),
                                        content: Text(response)));
                              }
                            } else {
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
                                final response = await ref
                                    .read(authProvider)
                                    .userSignUp(
                                        email: mailController.text.trim(),
                                        password: passController.text.trim(),
                                        username: nameController.text.trim(),
                                        image: image);
                                ref.read(loadingProvider.notifier).toggle();
                                if (response != 'success') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          duration:
                                              Duration(milliseconds: 1500),
                                          content: Text(response)));
                                }
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
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(isLogin == true
                            ? 'Don\t have an account ?'
                            : 'Already Have an account !',style: TextStyle(color: Colors.black),),
                        TextButton(
                            onPressed: () {
                              ref.read(loginProvider.notifier).toggle();
                            },
                            child: Text(isLogin == true ? 'Sign Up' : 'Login'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
