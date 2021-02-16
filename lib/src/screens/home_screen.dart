import 'package:courses/src/common/custom_text.dart';
import 'package:courses/src/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:courses/src/model/course.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int coins = 0;
  List<Course> courses = [];
  List<String> myCourses = [

    "Curso de Criação de Apps Android e iOS com Flutter - Crie 16 Apps",
    "Crie uma Loja Virtual Completa - Android e iOS com Flutter",

  ];

  @override
  void initState() {

    initCourses();



    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [

            SizedBox(width: 16,),
            Icon(FontAwesomeIcons.coins, color: Colors.yellow,),
            SizedBox(width: 5,),
            Text("$coins")

          ],
        ),
        title: Text("Cursos"),
        centerTitle: true,
      ),

      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [

            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: courses.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  childAspectRatio: 1.0
                ),
                itemBuilder: (_, index){

                  return Stack(
                    children: [

                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Stack(
                            children: [

                              Hero(
                                tag: index,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  child: Image.network(
                                    courses[index].cover,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),


                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [

                                          Colors.black.withOpacity(0.0),
                                          Colors.black.withOpacity(0.0),
                                          Colors.black.withOpacity(0.0),
                                          Colors.black.withOpacity(0.0),
                                          Colors.black.withOpacity(0.0),
                                          Colors.black.withOpacity(0.0),
                                          Colors.black.withOpacity(0.4),
                                          Colors.black.withOpacity(0.6),
                                          Colors.black.withOpacity(0.8),


                                        ]
                                    )
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    CustomText(
                                      courses[index].title,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    SizedBox(height: 5,),

                                    CustomText(
                                      courses[index].year,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                        onTap: (){

                          if(coins >= 1){
                            coins--;
                            myCourses.add(courses[index].title);
                            setState(() {

                            });
                          }

                        },
                      ),

                      Positioned(
                        top: 0,
                        right: 3,
                        child: Visibility(
                          visible: !myCourses.contains(courses[index].title),
                          child: Icon(
                            FontAwesomeIcons.lock,
                            size: 20,
                            color: Colors.yellow,
                          ),
                        ),
                      )

                    ],
                  );

                },
              ),
            ),

            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow)
              ),
              child: Text("Assista o vídeo e ganhe moedas!", style: TextStyle(color: Colors.black87),),
              onPressed: (){



              },
            )

          ],
        ),
      ),
    );

  }

  void initCourses(){

    courses.add(Course(
        cover: "https://i.imgur.com/in3a8m8.jpg",
        title: "Curso de Criação de Apps Android e iOS com Flutter - Crie 16 Apps",
        description: "Curso de Criação de Apps Android e iOS com Flutter - Crie 16 Apps",
        year: "2019"
    ));

    courses.add(Course(
        cover: "https://i.imgur.com/wCdgl1G.jpg",
        title: "Crie uma Loja Virtual Completa - Android e iOS com Flutter",
        description: "Crie uma Loja Virtual Completa - Android e iOS com Flutter",
        year: "2020"
    ));

    courses.add(Course(
        cover: "https://i.imgur.com/ahLQ5Ht.jpg",
        title: "Responsividade no Flutter | Mobile, Tablet,  Web e Desktop",
        description: "Responsividade no Flutter | Mobile, Tablet,  Web e Desktop",
        year: "2021"
    ));

  }

}

