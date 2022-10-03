import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_caballos/screens/profiles.dart';
import 'package:tomorrow_caballos/service/dio_caller.dart';

import '../login_view.dart';
import '../provider/second_route_notifier.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SecondRouteNotifier(),
        child: Consumer<SecondRouteNotifier>(
          builder: (context, myType, child) => Scaffold(
            appBar: AppBar(
              title: const Text('not gonna render'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  Column(children: [
                    SizedBox(
                      height: 30,
                    ),
                    facebooIsGood(),
                    build4Buttons(myType),
                    buildBottomText(context),
                    myType.image != null
                        ? Image.file(myType.image!,
                            width: 90, height: 90, fit: BoxFit.cover)
                        : Container(
                            height: 90,
                            child: Image.network(
                              'https://picsum.photos/250?image=9',
                            ),
                          ),
                    buildCustomButton(
                      title: 'pick from gallery',
                      icon: Icons.image_outlined,
                      onClick: () => (myType.getImage(ImageSource.gallery)),
                    ),
                    buildCustomButton(
                      title: 'take a photo',
                      icon: Icons.camera_outlined,
                      onClick: () => myType.getImage(ImageSource.camera),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildNavigate2DioCaller(context)
                  ]),
                  buildFbLogo(),
                ],
              ),
            ),
            bottomNavigationBar: buildBottomNavbar(),
          ),
        ));
  }

  ElevatedButton buildNavigate2DioCaller(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DioCallerScreen()),
          );
        },
        child: Text('go to DIO page'));
  }

  SizedBox buildCustomButton(
      {required String title,
      required IconData icon,
      required VoidCallback onClick}) {
    return SizedBox(
      width: 180,
      child: ElevatedButton(
        onPressed: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(
              width: 5,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }

  Center buildFbLogo() {
    return Center(
      heightFactor: 0.9,
      child: Image.asset(
        'assets/f2.png',
        width: 100,
      ),
    );
  }

  BottomNavigationBar buildBottomNavbar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
    );
  }

  SizedBox facebooIsGood() {
    return SizedBox(
      width: 250,
      height: 150,
      child: Card(
        shadowColor: Colors.blue,
        color: Colors.blueAccent,
        child: Center(child: Text("FAESBUC IS GOD")),
      ),
    );
  }

  TextButton buildBottomText(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: Colors.blue),
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginView()),
            (Route<dynamic> route) => false);
      },
      child: const Text('logga fuck out!'),
    );
  }

  GridView build4Buttons(SecondRouteNotifier myType) {
    return GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                myType.setSelectedIndex(index);
              },
              child: SizedBox(
                height: 40,
                width: 90,
                child: Card(
                  color: myType.selectedIndex == index
                      ? Colors.black
                      : Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      'Ability Tag',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ),
              ));
        });
  }
}
