import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: AppBar(backgroundColor: Colors.blue[200],elevation: 0,),
        backgroundColor: Colors.blue[200],
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Tournament',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Container(
                  
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),),
                  width: 360,
                  height: 350,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Log into your account',style: TextStyle(fontSize: 25),),
                        
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30,top: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Enter Name', label: Text('Name')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              label: Text('Password'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.blue,),
                           
                            child: Center(child: Text('Login')),
                            height: 50,
                            width: 310,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text('or'),
                SizedBox(
                  height: 5,
                ),
                Container(
                    height: 150,
                    width: 360,
                    child: Card(
                      child: Column(
                        children: [Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text('You don\'t have an account?'),
                        ), Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.green,),
                              child: Center(child: Text('Sign Up')),
                              height: 50,
                              width: 450,
                            ),
                          ),
                        )],
                      ),
                    ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
