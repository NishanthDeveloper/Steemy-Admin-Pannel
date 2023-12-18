import 'package:flutter/material.dart';
import 'package:foxton_steemy_admin_pannel/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
centerTitle: true,
        title: Text("Steemy Admin Pannel"),
        backgroundColor: Color(0xFF282828),
      ),
      body: const Center(
          child: Text(
            'A drawer is an invisible side screen.',
            style: TextStyle(fontSize: 20.0),
          )),
      drawer: Drawer(
        backgroundColor:Color(0xFF282828) ,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [

            ListTile(
              leading: const Icon(Icons.person,color: Color(0xFFefcf18),),
              title: const Text(' My Profile ',style: TextStyle(color: Color(0xFFefcf18)),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.fastfood_sharp,color: Color(0xFFefcf18),),
              title: const Text('Add Popular Products',style: TextStyle(color: Color(0xFFefcf18)),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person,color: Color(0xFFefcf18),),
              title: const Text(' My Profile ',style: TextStyle(color: Color(0xFFefcf18)),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person,color: Color(0xFFefcf18),),
              title: const Text(' My Profile ',style: TextStyle(color: Color(0xFFefcf18)),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person,color: Color(0xFFefcf18),),
              title: const Text(' My Profile ',style: TextStyle(color: Color(0xFFefcf18)),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ), //Drawer
    );
  }
}




