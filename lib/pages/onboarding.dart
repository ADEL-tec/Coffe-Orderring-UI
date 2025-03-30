import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final List<Widget> _pages = [
    OnboardingSlide(
      title: "Bienvenue sur OrderCoffee",
      description:
          "Votre café à votre façon! Commandez vos boissons préférées rapidement et faciliement. c'est parti!",
      image: 'assets/images/onboarding1.png',
      page: 1,
    ),
    OnboardingSlide(
      title: 'Personalisez votre expérience',
      description:
          'Dites-nous ce que vous aimez! Nous vous peoposerons le café idéal selon vos gouts?',
      image: 'assets/images/onboarding2.png',
      page: 2,
    ),
    OnboardingSlide(
      title: 'Commandez et savourez',
      description:
          'Commandez en quelqes clics, suivez votre café en temps réel et gagnez des récompenses à chaque achat? A vous la magie du café!',
      image: 'assets/images/onboarding3.png',
      page: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: PageView(children: _pages)));
  }
}

class OnboardingSlide extends StatelessWidget {
  const OnboardingSlide({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.page,
  });

  final String title;
  final String description;
  final String image;
  final int page;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image, width: 450, height: 450),
            Spacer(),
            Text(
              title,
              style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.2,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              children: [
                Row(
                  spacing: 10,
                  children: [
                    BullePage(pageNumber: page, bulleNumber: 1),
                    BullePage(pageNumber: page, bulleNumber: 2),
                    BullePage(pageNumber: page, bulleNumber: 3),
                  ],
                ),
                Spacer(),
                FilledButton(
                  onPressed: () => Navigator.pushNamed(context, "/home"),
                  child: Text("Commancer"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BullePage extends StatelessWidget {
  const BullePage({
    super.key,
    required this.pageNumber,
    required this.bulleNumber,
  });

  final int pageNumber;
  final int bulleNumber;

  @override
  Widget build(BuildContext context) {
    bool isThisPage = pageNumber == bulleNumber;

    return Container(
      height: isThisPage ? 10 : 8,
      width: isThisPage ? 10 : 8,
      decoration: BoxDecoration(
        color: isThisPage ? Colors.brown : Colors.grey,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
