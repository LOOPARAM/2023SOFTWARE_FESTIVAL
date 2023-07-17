import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue,),
        home: const FirstRoute()
    );
  }
}

class FirstRoute extends StatelessWidget with WidgetsBindingObserver{
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body:
      // App(),
      Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: Size(180,100),primary: Color.fromARGB(255,101, 40, 247),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)
            ),
          ),
          child: Text('시작하기',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>App()));
          },
        ),
      ),
    );
  }
}