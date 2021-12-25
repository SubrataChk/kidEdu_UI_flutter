// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:kid_edu_application/data/data.dart';
import 'package:kid_edu_application/view/description.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AnimalInformation animalInformation = AnimalInformation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: animalInformation.animalData.length,
                itemBuilder: (context, index) {
                  var data = animalInformation.animalData[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DescriptionPage(data: data)));
                    },
                    splashColor: Colors.green,
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: MediaQuery.of(context).size.height / 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Hero(
                                      tag: data["image"],
                                      child: Image(
                                        image: AssetImage(data["image"]),
                                        height: 130.h,
                                        width: 120.w,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            animalInformation.animalData[index]
                                                ["name"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22.sp),
                                          ),
                                          Text(
                                            animalInformation.animalData[index]
                                                ["title"],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18.sp),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      )),
    );
  }
}
