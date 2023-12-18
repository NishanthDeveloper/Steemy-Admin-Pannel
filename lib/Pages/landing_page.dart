import 'package:flutter/material.dart';
import 'package:foxton_steemy_admin_pannel/Pages/product_upload_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var currentDateTime;
  @override
  void initState() {
 currentDateTime =   DateTime.now();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffEEADF3),
          centerTitle: true,
          title: Text(
            "Admin Web Portal",
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 40, color: Colors.black),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                     "${currentDateTime}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 24, color: Colors.black),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 129,
                          width: 434,
                          decoration: BoxDecoration(
                              color: Color(0xffECE9E9),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Image.asset("assets/People.png"),
                                SizedBox(width: 15,),
                                Text(
                                  "All Active Users",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 129,
                          width: 434,
                          decoration: BoxDecoration(
                              color: Color(0xffEEADF3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Image.asset("assets/Unavailable (2).png"),
                                SizedBox(width: 15,),
                                Text(
                                  "Deactivate Users",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 129,
                          width: 434,
                          decoration: BoxDecoration(
                              color: Color(0xffEEADF3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Image.asset("assets/Device Shop.png"),
                                SizedBox(width: 15,),
                                Text(
                                  "All Active Sellers",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 129,
                          width: 434,
                          decoration: BoxDecoration(
                              color: Color(0xffECE9E9),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Image.asset("assets/Unavailable (1).png"),
                                SizedBox(width: 15,),
                                Text(
                                  "Deactivate Sellers",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 129,
                          width: 434,
                          decoration: BoxDecoration(
                              color: Color(0xffECE9E9),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Image.asset("assets/Mountain Biking.png"),
                                SizedBox(width: 15,),
                                Text(
                                  "All Active Riders",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 129,
                          width: 434,
                          decoration: BoxDecoration(
                              color: Color(0xffEEADF3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Image.asset("assets/Unavailable (2).png"),
                                SizedBox(width: 15,),
                                Text(
                                  "Deactivate Riders",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddFoods()));
                          },
                          child: Container(
                            height: 129,
                            width: 434,
                            decoration: BoxDecoration(
                                color: Color(0xffEEADF3),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Image.asset("assets/Device Shop.png"),
                                  SizedBox(width: 15,),
                                  Text(
                                    "Add Popular Foods",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 129,
                          width: 434,
                          decoration: BoxDecoration(
                              color: Color(0xffECE9E9),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Image.asset("assets/Unavailable (1).png"),
                                SizedBox(width: 15,),
                                Text(
                                  "Deactivate Sellers",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 355,
                height: 94,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFFD553DF)
                  ),
                  child: Text("Logout",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.black),),
                ),
              ),
            ],
          ),
        ),

    );
  }
}
