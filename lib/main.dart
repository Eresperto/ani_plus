import 'package:flutter/material.dart';

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
      home: const SubscriptionPage(),
    );
  }
}

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return const DesktopView();
          } else {
            return const MobileView();
          }
        },
      ),
    );
  }
}

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    SubscriptionCard(
                      title: 'Yandex Plus',
                      expiryDate: 'до 20.08.2008',
                      icon: Image.asset('assets/yandex_plus.png', width: 80, height: 80), // Placeholder
                    ),
                    const SizedBox(width: 20),
                    SubscriptionCard(
                      title: 'ChatGPT',
                      expiryDate: 'до 20.08.2008',
                      icon: Image.asset('assets/chatgpt.png', width: 80, height: 80), // Placeholder
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
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
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
                SubscriptionCard(
                  title: 'ChatGPT Plus',
                  expiryDate: 'до 20.08.2008',
                  icon: Image.asset('assets/chatgpt.png', width: 60, height: 60), // Placeholder
                ),
                const SizedBox(height: 20),
                SubscriptionCard(
                  title: 'Apple One',
                  expiryDate: 'до 20.08.2008',
                  icon: Image.asset('assets/apple.png', width: 60, height: 60), // Placeholder
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

class SubscriptionCard extends StatelessWidget {
  final String title;
  final String expiryDate;
  final Widget icon;

  const SubscriptionCard({
    super.key,
    required this.title,
    required this.expiryDate,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              expiryDate,
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


