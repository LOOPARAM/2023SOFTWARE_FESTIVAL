import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../CustomWidget.dart';
import '../GetData.dart';

class MainRoute extends StatefulWidget {
  const MainRoute({Key? key}) : super(key: key);

  @override
  State<MainRoute> createState() => SecondRoute();
}
class SecondRoute extends State<MainRoute> {
  bool Security = false;
  bool Condition_Screen = false;
  bool Condition_SideBtn = false;
  bool Condition_Movement = false;
  bool Action_Bell = false;
  bool Action_Voice = false;
  bool Action_Time = false;

  void initState() {
    super.initState();

    // 풀스크린 만들기
    // 반드시 여기서 불러줘야 하는 것은 아니다.
    // 앱 실행 중간에 전환을 해야할 경우 그 시점에서 불러줘도 무방하다.
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopupMenuButton<String>(
                      onSelected: (value) async {
                        print(value);
                        // 선택된 메뉴 아이템 처리
                        if(value == 'menu3'){
                          _auth.signOut();
                          Navigator.pop(context);
                        }
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'menu1',
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.account_circle),
                              Container(padding:EdgeInsets.fromLTRB(15, 0, 0, 0),child: Text('프로필'))
                            ],
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'menu2',
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Badge(
                                label: Text('9+'),
                                backgroundColor: Colors.red,
                                child: Icon(Icons.notifications),
                              ),
                              Container(padding:EdgeInsets.fromLTRB(15, 0, 0, 0),child: Text('알림'))
                            ],
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'menu3',
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.logout),
                              Container(padding:EdgeInsets.fromLTRB(15, 0, 0, 0),child: Text('로그아웃'))
                            ],
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'menu4',
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.settings),
                              Container(padding:EdgeInsets.fromLTRB(15, 0, 0, 0),child: Text('설정'))
                            ],
                          ),
                        ),
                      ],
                      splashRadius: 30,
                      iconSize: 40,
                      offset: Offset(0,60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          )
                      ),
                      icon: Icon(Icons.menu),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,100,0,20),
                child: Column(
                  children: [
                    GetSensors(),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(Security ? '현재 보안 켜짐' : '현재 보안 꺼짐 ',style: TextStyle(color: Colors.grey,fontWeight:FontWeight.w800),),
                        Switch(
                            activeColor: Color.fromARGB(255,101, 40, 247),
                            value: Security ,
                            onChanged: (value){
                              setState(() {
                                Security = value;
                              });
                            }
                        ),
                      ],
                    )

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,70),
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: ElevatedButton(
                    style: Security ?
                    ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255,101, 40, 247),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      ),
                    ) :
                    ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      ),
                    ),

                    onPressed: (){
                      setState(() {
                        Security = !Security;
                      });
                    },
                    child: Text(Security ? '보안 비활성화' : '보안 활성화',
                        style: TextStyle(fontSize: 25,color: Colors.white,fontWeight:FontWeight.w800)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60,0,60,20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('작동 감지 조건',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 100, 100, 100),fontWeight:FontWeight.w800)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,0,20,0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Setting_Element(Name: '화면 터치 감지'),
                          Setting_Element(Name: '측면 버튼 감지'),
                          Setting_Element(Name: '움직임 감지'),
                          Setting_Element(Name: '잠금 해제 감지'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,10,0,10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('보안 대응',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 100, 100, 100),fontWeight:FontWeight.w800)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,0,20,0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Setting_Element(Name: '비상벨'),
                          Setting_Element(Name: '경고 음성'),
                          Setting_Element(Name: '도난 시간 기록'),
                          Setting_Element(Name: '도난 위치 기록'),
                          Setting_Element(Name: '도난 음성 기록'),
                          Setting_Element(Name: '센서 정보 기록'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,10,0,10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('시간 예약',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 100, 100, 100),fontWeight:FontWeight.w800)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,0,20,100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Setting_Element(Name: '예약'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}







