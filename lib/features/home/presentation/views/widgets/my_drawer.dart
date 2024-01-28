import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
                child: Text(
                  'Weather Forecast',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                )),
          ),
          ListTile(
            title: const Text('90 Min. Weather'),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.forward),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
