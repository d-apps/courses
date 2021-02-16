import 'package:flutter/material.dart';
import 'package:courses/src/model/course.dart';

class DetailScreen extends StatelessWidget {

  final Course course;
  final int index;

  DetailScreen(this.course, this.index);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),
        centerTitle: true,
      ),

      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [

            Expanded(
              child: Container(
                child: Row(
                  children: [

                    Expanded(
                      child: Container(
                        //color: Colors.purple,
                        alignment: Alignment.topCenter,
                        child: Hero(
                          tag: index,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              course.cover,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        //color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("Nome: ${course.title}"),
                            Text("Ano: ${course.year}"),
                            Spacer(),
                            SizedBox(
                              width: width,
                              child: ElevatedButton(
                                child: Text("Iniciar"),
                                onPressed: (){},
                              ),
                            )

                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                //color: Colors.blue,
                child: Text(course.description),
              ),
            )

          ],
        ),
      ),
    );

  }
}
