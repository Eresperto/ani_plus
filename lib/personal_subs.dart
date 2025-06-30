import 'package:flutter/material.dart';
import 'package:langing_test/subscription_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subscription Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: SubscriptionPage(),
    );
  }
}

class SubscriptionPage extends StatelessWidget {
   SubscriptionPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return  DesktopView();
          } else {
            return  MobileView();
          }
        },
      ),
    );
  }
}

class DesktopView extends StatelessWidget {
   DesktopView({super.key});
  final List<ownerSubscriptions> ownerSubs = [
    ownerSubscriptions(title: 'ChatGPT', date: '20.08.2008', imagePath: 'assets/gpt.jpg'),
    ownerSubscriptions(title: 'Apple One', date: '20.08.2008', imagePath: 'assets/apple.jpg')
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final cardWidth = (screenWidth-120)/5;
    return Column(
      children: [
        // Desktop Navigation Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Text('Подписки', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 30),
                  Text('Преимущества', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 30),
                  Text('Поддержка', style: TextStyle(fontSize: 16)),
                ],
              ),
              Row(
                children: [
                  const Text('Вход', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4285F4), // Example blue color
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Перейти к покупке', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Main Content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Мои подписки',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubscriptionCardDesktop(
                      ownersub: ownerSubs[0],
                      width: cardWidth,
                    ),
                    const SizedBox(width: 20),
                    SubscriptionCardDesktop(
                      ownersub: ownerSubs[1],
                      width: cardWidth,
                    ),
                    const SizedBox(width: 20),
                    const AddSubscriptionCard(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MobileView extends StatelessWidget {
   MobileView({super.key});
   final List<ownerSubscriptions> ownerSubs = [
     ownerSubscriptions(title: 'ChatGPT', date: '20.08.2008', imagePath: 'assets/gpt.png'),
     ownerSubscriptions(title: 'Apple One', date: '20.08.2008', imagePath: 'assets/apple.png')
   ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final cardWidth = (screenWidth-40);
    final cardHeight = screenHeight*0.2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Mobile Header
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              const Text(
                'Мои подписки',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 48), // To balance the menu icon
            ],
          ),
        ),
        // Main Content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SubscriptionCardMobile(
                  ownersub: ownerSubs[0],
                  width: cardWidth,// Placeholder
                  height: cardHeight,

                ),
                const SizedBox(height: 20),
                SubscriptionCardMobile(
                  ownersub: ownerSubs[1],
                  width: cardWidth,// Placeholder
                  height: cardHeight,
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Перейти остальным к подпискам',
                    style: TextStyle(color: Color(0xFF4285F4), fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
class SubscriptionCardMobile extends StatelessWidget {
  final ownerSubscriptions ownersub;
  final  double width;
  final  double  height;

  const SubscriptionCardMobile({
    super.key,
    required this.ownersub,
    required this.width,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: width,
        child:
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
            Row(
              children: [
                Expanded(child: Image.asset(ownersub.imagePath, width: width*0.2,height: width*0.2,),flex: 1, ),
                Expanded(
                  flex: 1,
                    child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 10),
                    Text(
                      ownersub.title,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      ownersub.date,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: width*0.2599,
                          height: height*0.196,
                          child: GestureDetector(
                            onTap: (){},
                            child:
                            Container(
                              width: width,
                              //  height: height,
                              decoration: ShapeDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(0.31, 0.66),
                                  end: Alignment(1.15, 0.69),
                                  colors: [Color(0xFF2146C2), Color(0xCC40B0FF)],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'К подписке',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Montserrat',
                                    // fontFamily: 'Manjari',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )


                    // ElevatedButton(
                    //   style: ButtonStyle(
                    //     // Отменяем фон по умолчанию, тень и др.
                    //     backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    //     shadowColor: MaterialStateProperty.all(Colors.transparent),
                    //     elevation: MaterialStateProperty.all(0),
                    //     padding: MaterialStateProperty.all(
                    //       const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                    //     ),
                    //     shape: MaterialStateProperty.all(
                    //       RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),
                    //     ),
                    //   ),
                    //   onPressed: (){},
                    //   child: Ink(
                    //     decoration: BoxDecoration(
                    //       gradient: const LinearGradient(
                    //         begin: Alignment.centerLeft,
                    //         end: Alignment.centerRight,
                    //         colors: [
                    //           Color(0xFF1A47E3), // тёмно-синий край слева
                    //           Color(0xFF4DA3FF), // голубой край справа
                    //         ],
                    //       ),
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     child: Container(
                    //       constraints: const BoxConstraints(minHeight: 48),
                    //       alignment: Alignment.center,
                    //       child: Text(
                    //         'К подписке',
                    //         style: const TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                )
                )

              ],
            )
            ,
          ),
        ),
      );
  }
}
class SubscriptionCardDesktop extends StatelessWidget {
  final ownerSubscriptions ownersub;
  final  double width;

  const SubscriptionCardDesktop({
    super.key,
    required this.ownersub,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return
    Container(
      width: width,
      child:
      Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ownersub.imagePath, width: width*0.3,height: width*0.3,),
              const SizedBox(height: 10),
              Text(
                ownersub.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                ownersub.date,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4285F4),
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('К подписке', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddSubscriptionCard extends StatelessWidget {
  const AddSubscriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: 200, // Adjust width as needed
        height: 200, // Adjust height as needed
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_forward_ios,
              size: 60,
              color: const Color(0xFF4285F4),
            ),
            const SizedBox(height: 10),
            const Text(
              'Перейти к другим\nподпискам',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0xFF4285F4)),
            ),
          ],
        ),
      ),
    );
  }
}


