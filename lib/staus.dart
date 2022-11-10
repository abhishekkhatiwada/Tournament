
import 'package:esport/Provider/authProvider.dart';
import 'package:esport/authPage.dart';
import 'package:esport/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'onBoarding.dart';




class StatusPage extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer(
            builder: (context, ref, child) {
              final authData = ref.watch(authStream);
              return  authData.when(
                  data: (data){
                    if(data == null){
                      return AuthPage();
                    }else{
                      return onboard();
                    }
                  },
                  error: (err, stack) => Center(child: Text('$err')),
                  loading: () => Center(child: CircularProgressIndicator())
              );
            }
    )
    );
  }
}