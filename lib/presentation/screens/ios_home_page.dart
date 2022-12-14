import 'package:chandramdutta/constants.dart';
import 'package:chandramdutta/presentation/widgets/social_buttons.dart';
import 'package:chandramdutta/providers/provider.dart';
import 'package:chandramdutta/responsive/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher_string.dart';

class IOSHomePage extends ConsumerWidget {
  const IOSHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        CupertinoPageScaffold(
          child: CustomScrollView(slivers: [
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Portfolio'),
            ),
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        isDesktop(context, 650)
                            ? Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: CupertinoButton.filled(
                                      onPressed: () {},
                                      child: const Text("Download Resume"),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  SizedBox(
                                    height: 50,
                                    child: CupertinoButton(
                                      onPressed: () {
                                        launchUrlString(mail);
                                      },
                                      child: const Icon(CupertinoIcons.mail),
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
                    child: !isDesktop(context, 650)
                        ? Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: SizedBox(
                                  height: 50,
                                  child: CupertinoButton(
                                    onPressed: () {},
                                    child: const Text("Download Resume"),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 50,
                                  child: CupertinoButton(
                                    onPressed: () {
                                      launchUrlString(mail);
                                    },
                                    child: const Icon(CupertinoIcons.mail),
                                  ),
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
                    height: 70,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: isDesktop(context, 500)
                            ? MediaQuery.of(context).size.width
                            : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            SocialButtonsiOS(
                              icon: FaIcon(FontAwesomeIcons.twitter),
                              url: twitterUrl,
                            ),
                            SocialButtonsiOS(
                              icon: FaIcon(FontAwesomeIcons.github),
                              url: githubUrl,
                            ),
                            SocialButtonsiOS(
                              icon: FaIcon(FontAwesomeIcons.linkedinIn),
                              url: linkedinUrl,
                            ),
                            SocialButtonsiOS(
                              icon: FaIcon(FontAwesomeIcons.instagram),
                              url: instagramUrl,
                            ),
                            SocialButtonsiOS(
                              icon: FaIcon(FontAwesomeIcons.snapchat),
                              url: snapchatUrl,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "About Me:",
                      )),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      intro,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
          ]),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: CupertinoTabBar(
              items: const [
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.android),
                  label: 'Android',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.apple),
                  label: 'iOS',
                ),
              ],
              currentIndex: ref.watch(osTypeProvider),
              onTap: (value) {
                ref.read(osTypeProvider.state).state = value;
              },
            ),
          ),
        ),
      ],
    );
  }
}
