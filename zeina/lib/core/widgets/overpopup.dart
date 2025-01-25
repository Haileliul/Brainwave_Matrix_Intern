import 'package:flutter/material.dart';

class LangPopup extends StatelessWidget {
  const LangPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: 120,
        height: 160,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListTile(
                title: Text('አማርኛ'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.onSecondary,
                      width: 1),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text('ትግርኛ'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.onSecondary,
                      width: 1),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text('Oromoo'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.onSecondary,
                      width: 1),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
