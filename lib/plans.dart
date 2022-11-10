import 'package:flutter/material.dart';


class plans extends StatelessWidget {
  const plans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        elevation: 0,
        title: Text(
          'Esports Engagement',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          height: 150,
          width: double.infinity,
          color: Colors.blue[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Pricing',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text('Pick the best Plan for your Project',
                    style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 180,
          width: 360,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Free',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text('For community and friendly tournaments',
                      style: TextStyle(fontSize: 13)),
                  GestureDetector(
                      child: Container(
                    height: 50,
                    width: 320,
                    color: Colors.amber,
                    child: Center(
                      child: Text('Start now'),
                    ),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Up to 100 participants',
                          style: TextStyle(fontSize: 13))
                    ],
                  )
                ],
              ),
            ),
          ),
        ), Container(
          height: 180,
          width: 360,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Tourney',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text('Your own tournament website with your brand identity',
                      style: TextStyle(fontSize: 13)),
                  GestureDetector(
                      child: Container(
                    height: 50,
                    width: 320,
                    color: Colors.amber,
                    child: Center(
                      child: Text('Rs. 500'),
                    ),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('For 1 tournament',
                          style: TextStyle(fontSize: 13))
                    ],
                  )
                ],
              ),
            ),
          ),
        ), Container(
          height: 180,
          width: 360,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Series',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text('For community and friendly tournaments',
                      style: TextStyle(fontSize: 13)),
                  GestureDetector(
                      child: Container(
                    height: 50,
                    width: 320,
                    color: Colors.amber,
                    child: Center(
                      child: Text('Rs. 1000'),
                    ),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('unlimited participants',
                          style: TextStyle(fontSize: 13))
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
