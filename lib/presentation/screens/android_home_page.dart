import 'package:chandramdutta/presentation/widgets/download_resume.dart';
import 'package:chandramdutta/presentation/widgets/social_buttons.dart';
import 'package:chandramdutta/providers/provider.dart';
import 'package:chandramdutta/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparent_image/transparent_image.dart';

class AndroidHomePage extends ConsumerWidget {
  const AndroidHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            ListView(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(),
                  child: Text('Menu'),
                ),
                ListTile(
                  title: const Text('Tech Stack'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Projects'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('About'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Open Source Libraries'),
                  onTap: () {
                    showLicensePage(context: context);
                  },
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black,
                width: 310,
                child: const Text(
                  "Chandram Dutta\n© 2022",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: ((value) {
          ref.read(osTypeProvider.state).state = value;
        }),
        selectedIndex: ref.watch(osTypeProvider),
        destinations: const [
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.android),
            label: 'Android',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.apple),
            label: 'iOS',
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image:
                          'https://avatars.githubusercontent.com/u/81961406?s=400&u=7a11ec4555bdf241738936b92cc5c9db5336df3a&v=4',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    'Hello,\nI am Chandram Dutta',
                  ),
                ),
                isDesktop(context, 550)
                    ? Row(
                        children: [
                          const SizedBox(
                            height: 50,
                            child: DownloadResumeButtonAndroid(),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: const Icon(Icons.mail),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: !isDesktop(context, 550)
                ? Row(
                    children: [
                      const Expanded(
                        child: SizedBox(
                          height: 50,
                          child: DownloadResumeButtonAndroid(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Icon(Icons.mail),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text("Socials:"),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: isDesktop(context, 400)
                    ? MediaQuery.of(context).size.width
                    : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SocialButtonsAndroid(
                      icon: FaIcon(FontAwesomeIcons.twitter),
                      url: "https://twitter.com/ChandramDutta",
                    ),
                    SocialButtonsAndroid(
                      icon: FaIcon(FontAwesomeIcons.github),
                      url: "https://www.github.com/Chandram-Dutta",
                    ),
                    SocialButtonsAndroid(
                      icon: FaIcon(FontAwesomeIcons.linkedinIn),
                      url:
                          "https://www.linkedin.com/in/chandram-dutta-a8b8a817b/",
                    ),
                    SocialButtonsAndroid(
                      icon: FaIcon(FontAwesomeIcons.instagram),
                      url: "https://www.instagram.com/chandram.dutta",
                    ),
                    SocialButtonsAndroid(
                      icon: FaIcon(FontAwesomeIcons.snapchat),
                      url: "https://www.instagram.com/chandram.dutta",
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child:
                Text("About Me:", style: Theme.of(context).textTheme.bodyLarge),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "I am Chandram Dutta. A 18 years old Flutter Developer with experience in Firebase, Appwrite and more. I am open to any opportunity to learn and grow.",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
