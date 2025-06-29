import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ANI+ Subscription App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const SubscriptionPage(),
      debugShowCheckedModeBanner: false,
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
          // Определяем, является ли экран мобильным или десктопным
          bool isMobile = constraints.maxWidth < 768;
          
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF4A5FE7), // Синий цвет
                  Color(0xFF6B7FFF), // Более светлый синий
                ],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 20.0 : 40.0),
                child: isMobile 
                    ? _buildMobileLayout(context)
                    : _buildDesktopLayout(context),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        // Левая часть с текстом
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  _buildMainTitle(),
                  _buildDiscountBadge(),

                  // Positioned(
                  //     left: 30,
                  //     bottom: 20,
                  //     child: )
                //  ,
                ],
              ),
             // const SizedBox(height: 24),

              const SizedBox(height: 32),
              _buildSubtitle(),
              const SizedBox(height: 48),
              _buildActionButton(),
            ],
          ),
        ),
        // Правая часть с логотипом
        Expanded(
          flex: 2,
          child: _buildLogo(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //const Spacer(flex: 1),

        Stack(
          children: [
            _buildMainTitle(),
            _buildDiscountBadge(),
          ],
        ),
        const SizedBox(height: 16),

        const SizedBox(height: 24),
        _buildSubtitle(),
        const Spacer(flex: 2),
        _buildLogo(),
        const Spacer(flex: 1),
        _buildActionButton(),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildMainTitle() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 768;
        
        return Text(
          'ЭКОНОМЬТЕ НА САМЫХ\nПОПУЛЯРНЫХ ПОДПИСКАХ',
          style: TextStyle(
            fontSize: isMobile ? 28 : 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.1,
          ),
        );
      },
    );
  }

  Widget _buildDiscountBadge() {
    return Transform.rotate(
      angle: 0.1, // Небольшой поворот
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Text(
          'до 70%',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4A5FE7),
          ),
        ),
      ),
    );
  }

  Widget _buildSubtitle() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 768;
        
        return Text(
          'Получайте доступ к любимым сервисам\nбыстро и надежно по доступной цене!',
          style: TextStyle(
            fontSize: isMobile ? 16 : 20,
            color: Colors.white.withValues(alpha: 0.9),
            height: 1.4,
          ),
        );
      },
    );
  }

  Widget _buildActionButton() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 768;
        
        return SizedBox(
          width: isMobile ? double.infinity : 280,
          child: ElevatedButton(
            onPressed: () {
              // Действие при нажатии на кнопку
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF4A5FE7),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 8,
              shadowColor: Colors.black.withValues(alpha: 0.3),
            ),
            child: Text(
              'Перейти к покупке',
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLogo() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 768;
        
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Основной текст ANI
              Text(
                'ANI',
                style: TextStyle(
                  fontSize: isMobile ? 80 : 120,
                  fontWeight: FontWeight.w300,
                  color: Colors.white.withValues(alpha: 0.9),
                  letterSpacing: 4,
                ),
              ),
              // Плюс справа
              Positioned(
                right: isMobile ? -20 : -30,
                top: isMobile ? 10 : 15,
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: isMobile ? 40 : 60,
                    fontWeight: FontWeight.w300,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

