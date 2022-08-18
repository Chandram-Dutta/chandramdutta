import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialButtonsAndroid extends StatelessWidget {
  const SocialButtonsAndroid({
    Key? key,
    required this.icon,
    required this.url,
  }) : super(key: key);

  final FaIcon icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60,
        width: 60,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          onPressed: () {
            launchUrlString(url);
          },
          child: icon,
        ),
      ),
    );
  }
}

class SocialButtonsiOS extends StatelessWidget {
  const SocialButtonsiOS({
    Key? key,
    required this.icon,
    required this.url,
  }) : super(key: key);

  final FaIcon icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 70,
        width: 70,
        child: CupertinoButton(
          onPressed: () {
            launchUrlString(url);
          },
          child: icon,
        ),
      ),
    );
  }
}
