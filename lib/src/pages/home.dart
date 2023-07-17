import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'MainPage.dart';
import 'login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot){
          if(!snapshot.hasData){
            return LoginWidget();
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\'${snapshot.data?.displayName}\' 님 환영합니다',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                  SizedBox(height: 30,),
                  ElevatedButton(
                      onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>(MainRoute())));
                        },
                      child: Text('다음'),
                  )

                ],
              ),
            );
          }
        },
      )
    );
  }
}
