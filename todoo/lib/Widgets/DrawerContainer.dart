import 'package:flutter/material.dart';

List<Map<String, dynamic>> _item = [
  {'name': "About", 'icon': Icons.info},
  {'name': "Rate Us", 'icon': Icons.star},
  {'name': "More Apps", 'icon': Icons.apps},
  {'name': "Contact", 'icon': Icons.contact_mail},
];

Widget showDrawer(Size size) {
  return Container(
    width: size.width * 0.7,
    color: Colors.white,
    child: Column(
      children: [
        Container(
          height: size.height * 0.3,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('Assets/Images/DrawerHeader.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'Assets/Images/IconBgremoved.png',
                height: size.height * 0.2,
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.6,
          child: ListView.builder(
            itemCount: _item.length,
            itemBuilder: (context, index) {
              final item = _item[index];
              return Column(
                children: [
                  ListTile(
                    leading: Icon(item['icon']),
                    title: Text(item['name']),
                    onTap: () {},
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      height: 5,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    ),
  );
}
