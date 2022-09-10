import 'package:chandramdutta/constants.dart';
import 'package:chandramdutta/presentation/widgets/download_resume.dart';
import 'package:chandramdutta/presentation/widgets/social_buttons.dart';
import 'package:chandramdutta/providers/provider.dart';
import 'package:chandramdutta/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AndroidHomePage extends ConsumerWidget {
  const AndroidHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      drawer: !isDesktop(context, 600)
          ? Drawer(
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
                        onTap: () {
                          showAboutDialog(context: context);
                        },
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
            )
          : null,
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
      body: Row(
        children: [
          isDesktop(context, 600)
              ? NavigationRail(
                  onDestinationSelected: (value) {
                    switch (value) {
                      case 0:
                        break;
                      case 1:
                        break;
                      case 2:
                        showAboutDialog(
                          context: context,
                          applicationName: 'Chandram Dutta',
                          applicationVersion: "1.0.2 on Flutter 3.3.1",
                          applicationIcon: ClipOval(
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
                        );
                        break;
                      case 3:
                        showLicensePage(
                          context: context,
                          applicationName: 'Chandram Dutta',
                          applicationVersion: "1.0.2 on Flutter 3.3.1",
                          applicationIcon: ClipOval(
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
                        );
                        break;
                      default:
                    }
                  },
                  destinations: const [
                    NavigationRailDestination(
                      icon: FaIcon(FontAwesomeIcons.gears),
                      label: Text('Tech Stack'),
                    ),
                    NavigationRailDestination(
                      icon: FaIcon(FontAwesomeIcons.diagramProject),
                      label: Text('Projects'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.info),
                      label: Text('About'),
                    ),
                    NavigationRailDestination(
                      icon: FaIcon(FontAwesomeIcons.code),
                      label: Text('Open Source Libraries'),
                    ),
                  ],
                  selectedIndex: 0,
                  extended: isDesktop(context, 800) ? true : false,
                )
              : const SizedBox(),
          Expanded(
            child: ListView(
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
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      launchUrlString(mail);
                                    },
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
                                onPressed: () {
                                  launchUrlString(mail);
                                },
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SocialButtonsAndroid(
                          icon: FaIcon(FontAwesomeIcons.twitter),
                          url: twitterUrl,
                        ),
                        SocialButtonsAndroid(
                          icon: FaIcon(FontAwesomeIcons.github),
                          url: githubUrl,
                        ),
                        SocialButtonsAndroid(
                          icon: FaIcon(FontAwesomeIcons.linkedinIn),
                          url: linkedinUrl,
                        ),
                        SocialButtonsAndroid(
                          icon: FaIcon(FontAwesomeIcons.instagram),
                          url: instagramUrl,
                        ),
                        SocialButtonsAndroid(
                          icon: FaIcon(FontAwesomeIcons.snapchat),
                          url: snapchatUrl,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text("About Me:",
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    intro,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
