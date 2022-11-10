
import 'package:esport/Provider/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class HomePage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ref) {
    final userData = ref.watch(singleUserStream);
    return  Scaffold(
      appBar: AppBar(
        title: Text('Sample Social'),
      ),
        drawer: Drawer(
          child: userData.when(
              data: (data){
                return ListView(
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(data.imageUrl!), fit: BoxFit.cover)
                      ),
                      child: Text(data.firstName!),
                    ),
                    ListTile(
                      leading: Icon(Icons.mail),
                      title: Text(data.metadata!['email']),
                    ),
                    ListTile(
                      onTap: (){
                        Navigator.of(context).pop();
                        ref.read(authProvider).userLogOut();
                      },
                      leading: Icon(Icons.exit_to_app),
                      title: Text('LogOut'),
                    )
                  ],
                );
              },
              error: (err, stack) => Text('$err'),
              loading: () => Center(child: CircularProgressIndicator(),)
          )
        ),
        body: Container()
    );
  }
}