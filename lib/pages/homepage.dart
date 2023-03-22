import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:smart_home_ui/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List mySmartDevices = [
    //smartDevices, iconPath, PowerStatus
    ["Smart Light", "lib/icons/light-bulb.png", true],
    ["Smart AC", "lib/icons/air-conditioner.png", true],
    ["Smart TV", "lib/icons/smart-tv.png", false],
    ["Smart Light", "lib/icons/fan.png", false],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            // TODO :custom aapbar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //TODO: MENU ICON
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  //todo: account icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //todo welcome home
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Home"),
                  Text(
                    " Yugo",
                    style: TextStyle(fontSize: 40),
                  )
                ],
              ),
            ),

            //todo: smart device+ grid

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 25,
              ),
              child: Text("Smart Devices"),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: mySmartDevices.length,
                  padding: EdgeInsets.all(25),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                  itemBuilder: (context, index) {
                    return SmartDeviceBox(
                        smartDeviceName: mySmartDevices[index][0],
                        iconPath: mySmartDevices[index][1],
                        powerOn: mySmartDevices[index][2]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
