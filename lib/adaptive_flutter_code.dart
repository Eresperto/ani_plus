import 'package:flutter/material.dart';
import 'package:langing_test/registration_screen.dart';
import 'package:langing_test/subscription_model.dart';
import 'package:langing_test/subscription_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const FigmaToCodeApp());
}

// Адаптивная версия приложения
class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
late Subscription subscription;
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: AdaptiveLanding(),
            ),
          ),
        ),
        '/registration': (context) => RegistrationScreen(),
        '/subscription': (context) => SubscriptionPage(subscription: ModalRoute.of(context)!.settings.arguments as Subscription),
      },
    );
  }
}

Future<void> _openTelegram(/*String url*/) async {
  final uri = Uri.parse('https://t.me/beeschoologe');
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch https://t.me/beeschoologe';
  }
}

// Адаптивная версия Landing страницы
class AdaptiveLanding extends StatelessWidget {
   AdaptiveLanding({Key? key}) : super(key: key);

  // Данные для подписок
   final List<Subscription> subscriptions = [
     Subscription(
       title: 'ChatGPT Plus',
       price: '380',
       crossprice: '1720',
       description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut',
       imagePath: 'assets/gpt.jpg',
     ),
     Subscription(
       title: 'Spotify Premium',
       price: '120',
       crossprice: '1200',
       description: 'Наслаждайтесь музыкой без рекламы, оффлайн и с неограниченным пропуском треков.',
       imagePath: 'assets/spotify.jpg',
     ),
     Subscription(
       title: 'NordVPN',
       price: '300',
       crossprice: '720',
       description: 'Защитите свою конфиденциальность в интернете с помощью быстрого и безопасного VPN-соединения.',
       imagePath: 'assets/nordvpn.jpg',
     ),
     Subscription(
       title: 'Яндекс Плюс',
       price: '199',
       crossprice: '400',
       description: 'Доступ к фильмам, музыке, кешбэку и другим сервисам Яндекса.',
       imagePath: 'assets/ya_plus.jpg',
     ),
     Subscription(
       title: 'Apple One',
       price: '300',
       crossprice: '520',
       description: 'Подписка от Apple , включающая все самые удобные онлайн сервисы',
       imagePath: 'assets/apple.jpg',
     ),
   ];

  @override
  Widget build(BuildContext context) {
    // Получаем размеры экрана для адаптивных расчетов
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    
    // Адаптивные размеры шрифтов
    final headerFontSize = screenWidth * 0.04; // 5% от ширины экрана
    final titleFontSize = screenWidth * 0.031; // 3.5% от ширины экрана
    //final titleFontSize = screenWidth * 0.035; // 3.5% от ширины экрана
    final subtitleFontSize = screenWidth * 0.025; // 2.5% от ширины экрана
    final bodyFontSize = screenWidth * 0.016; // 1.8% от ширины экрана

    // Адаптивные отступы
    final horizontalPadding = screenWidth * 0.05; // 5% от ширины экрана
    final verticalPadding = screenHeight * 0.03; // 3% от высоты экрана
    
    return Container(
      color: const Color(0xFFF8FAFC),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Верхняя навигация
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Навигационные ссылки
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildNavItem('Подписки', headerFontSize * 0.4, context),
                      SizedBox(width: screenWidth * 0.03),
                      _buildNavItem('Преимущества', headerFontSize * 0.4, context),
                      SizedBox(width: screenWidth * 0.03),
                      _buildNavItem('Поддержка', headerFontSize * 0.4, context),
                    ],
                  ),
                ),

                // Кнопка "Перейти к покупке"
                // _buildGradientButton(
                //   'Перейти к покупке',
                //   width: screenWidth * 0.2109,
                //   height: screenHeight * 0.097,
                //   fontSize: headerFontSize * 0.35,
                //   context: context,
                // ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return screenWidth > 900
                        ? _buildGradientButton(
                      'Перейти к покупке',
                      17,
                      width: screenWidth * 0.21,
                      height: screenHeight * 0.07,
                      fontSize: headerFontSize * 0.35,
                      context: context,
                      onPressed: () {
                        Navigator.pushNamed(context, '/registration');
                      },
                    )
                        : _buildGradientButton(
                      'Перейти к покупке',
                      9,
                      width: screenWidth * 0.2109,
                      height: screenHeight * 0.04,
                      fontSize: headerFontSize * 0.35,
                      context: context,
                      onPressed: () {
                        Navigator.pushNamed(context, '/registration');
                      },
                    );
                  },
                ),
              ],
            ),
          ),


          // Основной контент
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: screenHeight*0.2),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Заголовок и изображение

                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //    mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     // Заголовок и скидка
                //     // Expanded(
                //     //   flex: 4,
                //      // child:
                //     Container(
                //       height: screenWidth * 0.15,
                //       child:
                //       Row(
                //          crossAxisAlignment: CrossAxisAlignment.center,
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           Text(
                //             'Экономьте на самых\nпопулярных подписках',
                //             style: TextStyle(
                //               color: Colors.black,
                //               fontSize: headerFontSize*1.1,
                //               fontFamily: 'Manjari',
                //               fontWeight: FontWeight.w400,
                //               height: 1.32,
                //             ),
                //           ),
                //           SizedBox(height: screenWidth * 0.03),
                //
                //
                //           Expanded(
                //             flex: 1,
                //             child:
                //             Container(
                //               height: screenHeight * 0.8,
                //               decoration: const BoxDecoration(
                //                 image: DecorationImage(
                //                   image: AssetImage('assets/logoimage.jpg'),
                //                   fit: BoxFit.contain,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //
                //    // ),
                //     LayoutBuilder(
                //       builder: (context, constraints) {
                //         // Адаптивная компоновка карточек в зависимости от ширины экрана
                //         return screenWidth > 900
                //             ? _buildGradientButton(
                //           'До 70%',
                //           width: screenWidth * 0.19,
                //           height: screenHeight * 0.13,
                //           fontSize: headerFontSize,
                //           context: context,
                //         )
                //             : _buildGradientButton(
                //           'До 70%',
                //           width: screenWidth * 0.21,
                //           height: screenHeight * 0.08,
                //           fontSize: headerFontSize,
                //           context: context,
                //         );
                //       },
                //     ),
                //     // Изображение
                //     // Expanded(
                //     //   flex: 2,
                //     //   child: Container(
                //     //     height: screenHeight * 0.3,
                //     //     decoration: const BoxDecoration(
                //     //       image: DecorationImage(
                //     //         image: AssetImage('assets/logoimage.jpg'),
                //     //         fit: BoxFit.contain,
                //     //       ),
                //     //     ),
                //     //   ),
                //     // ),
                //   ],
                // ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Заголовок и скидка
                      // Expanded(
                      //   flex: 4,
                      // child:
                      Container(
                        height: screenWidth * 0.27,
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Экономьте на самых\nпопулярных подписках',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: headerFontSize*0.85,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                // fontFamily: 'Unbounded',
                                // fontWeight: FontWeight.w500,
                                // fontFamily: 'Manjari',
                                // fontWeight: FontWeight.w700,
                                height: 1.32,
                              ),
                            ),
                            SizedBox(height: screenWidth * 0.03),


                            LayoutBuilder(
                              builder: (context, constraints) {
                                // Адаптивная компоновка карточек в зависимости от ширины экрана
                                return screenWidth > 900
                                    ?
                                _buildGradientButton(
                                  'До 70%',
                                  17,
                                  width: screenWidth * 0.24,
                                  height: screenHeight * 0.12,
                                  fontSize: headerFontSize,
                                  context: context,
                                )
                                // _buildGradientButton(
                                //   'До 70%',
                                //   width: screenWidth * 0.19,
                                //   height: screenHeight * 0.13,
                                //   fontSize: headerFontSize,
                                //   context: context,
                                // )
                                    : _buildGradientButton(
                                  'До 70%',
                                  10,
                                  width: screenWidth * 0.24,
                                  height: screenHeight * 0.068,
                                  fontSize: headerFontSize,
                                  context: context,
                                );
                              },
                            ) ,
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child:
                        Container(
                         // height: screenWidth * 0.35,
                          height: screenWidth * 0.2,
                          width: screenWidth * 0.15,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/logoimage.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      // ),

                      // Изображение
                      // Expanded(
                      //   flex: 2,
                      //   child: Container(
                      //     height: screenHeight * 0.3,
                      //     decoration: const BoxDecoration(
                      //       image: DecorationImage(
                      //         image: AssetImage('assets/logoimage.jpg'),
                      //         fit: BoxFit.contain,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                )
                ,
                SizedBox(height: screenHeight * 0.05),

                SizedBox(height: screenHeight * 0.05),
            Column(
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'ПОЧЕМУ ВЫБИРАЮТ ANI+?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: titleFontSize,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'наши преимущества',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: subtitleFontSize,
                        fontFamily: 'Manjari',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                // Секция "Наши преимущества"


                SizedBox(height: screenWidth * 0.03),

                // Карточки преимуществ
                LayoutBuilder(
                  builder: (context, constraints) {
                    // Адаптивная компоновка карточек в зависимости от ширины экрана
                    return screenWidth > 900
                        ? _buildAdvantagesRow(
                      constraints.maxWidth,
                      screenHeight,
                      titleFontSize,
                      bodyFontSize,
                    )
                        : _buildAdvantagesColumn(
                       // : _buildAdvantagesColumn(
                      constraints.maxWidth,
                      screenHeight,
                      titleFontSize,
                      bodyFontSize,
                    );
                  },
                ),
              ],
            ),


                SizedBox(height: screenWidth * 0.09),

                // Секция "Выберете свою подписку"
                Center(
                  child: Text(
                    'Выберете свою подписку',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: titleFontSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                SizedBox(height: screenWidth * 0.06),

                // Карточки подписок
                LayoutBuilder(
                  builder: (context, constraints) {
                    // Адаптивная компоновка карточек подписок в зависимости от ширины экрана
                    return screenWidth > 650
                        ? _buildSubscriptionRow(
                           // constraints.maxWidth,
                            screenWidth,
                            screenHeight,
                            titleFontSize,
                            subtitleFontSize,
                            context,
                          )
                        : _buildSubscriptionColumn(
                            constraints.maxWidth,
                            screenHeight,
                            screenWidth,
                            titleFontSize,
                            subtitleFontSize,
                            context,
                          );
                  },

                ),
                SizedBox(height: screenWidth*0.1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Почему так выгодно?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: titleFontSize*1.2,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: screenWidth*0.04,),
                        Text("Наш сервис автоматически\nподключает вас к семейному доступу\nподписки, поэтому цена одной\nподписки распределяется между\nнесколькими пользователями",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: subtitleFontSize,
                            // fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    Expanded(
                      flex: 1,
                      child:
                      Container(
                        height: screenWidth * 0.25,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/people_group.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          
          SizedBox(height: screenHeight * 0.05),

          // Футер
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding * 1.5,
              horizontal: horizontalPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Логотип в футере
                Container(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.15,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/ml.jpg'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                
                // Навигация в футере
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildNavItem('Подписки', bodyFontSize * 1.2, context),
                      SizedBox(width: screenWidth * 0.03),
                      _buildNavItem('Преимущества', bodyFontSize * 1.2, context),
                      SizedBox(width: screenWidth * 0.03),
                      _buildNavItem('Поддержка', bodyFontSize * 1.2, context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // Вспомогательный метод для создания элемента навигации
  Widget _buildNavItem(String text, double fontSize, BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSize,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
      ),
    );
  }
  
  // Вспомогательный метод для создания градиентной кнопки
  Widget _buildGradientButton(String text,int border_radius, {double? width, double? height, double? fontSize, required BuildContext context, VoidCallback? onPressed}) {
    return
      GestureDetector(
        onTap: onPressed,
      child:
      Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.31, 0.66),
          end: Alignment(1.15, 0.69),
          colors: [Color(0xFF2146C2), Color(0xCC40B0FF)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(border_radius as double),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontFamily: 'Montserrat',
           // fontFamily: 'Manjari',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
    )
    ;
  }

  // Вспомогательный метод для создания карточки преимущества
  Widget _buildAdvantageCard(
    String asset,
    String title,
    String description,
    double width,
    double height,
    double titleFontSize,
    double descriptionFontSize,
  ) {
    return Padding(
      padding: EdgeInsets.all(height*0.01),
      child: Container(
        width: width,
        padding: EdgeInsets.all(width * 0.07),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width*0.1),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 6,
              offset: Offset(0, 2),
              spreadRadius: 2,
            ),
            BoxShadow(
              color: Color(0x4C000000),
              blurRadius: 2,
              offset: Offset(0, 1),
              spreadRadius: 0,
            ),
          ],
        ),
        child:
            // Row(
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Text(
            //           title,
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             color: Colors.black,
            //             fontSize: titleFontSize,
            //             fontFamily: 'Manjari',
            //             fontWeight: FontWeight.w400,
            //             height: 1.32,
            //           ),
            //         ),
            //         Text(
            //           description,
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             color: Colors.black,
            //             fontSize: descriptionFontSize,
            //             fontFamily: 'Manjari',
            //             fontWeight: FontWeight.w400,
            //             height: 1.32,
            //           ),
            //         ),
            //       ],
            //     ),
            //     Container(
            //       height: width*0.25,
            //       child: Image.asset(asset),
            //     ),
            //   ],
            // )
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: width*0.5,
              child: Image.asset(asset),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: titleFontSize*0.8,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 1.32,
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: descriptionFontSize,
                    fontFamily: 'Manjari',
                    fontWeight: FontWeight.w400,
                    height: 1.32,
                  ),
                ),
              ],
            )
          ],
        ),

      ),

    )
      
      ;
  }
  
  // Вспомогательный метод для создания строки преимуществ (для больших экранов)
  Widget _buildAdvantagesRow(
    double maxWidth,
    double screenHeight,
    double titleFontSize,
    double bodyFontSize,
  ) {
    final cardWidth = (maxWidth - 120) / 3; // 3 карточки в ряд с отступами
    final cardHeight = screenHeight * 0.25;
    
    return
      IntrinsicHeight(
        child:

      Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildAdvantageCard(
          'assets/li.jpg',
          'Скорость',
          'После оплаты вам моментально прийдут данные дла подключения подписки',
          cardWidth,
          cardHeight,
          titleFontSize * 0.9,
          bodyFontSize,
        ),
        _buildAdvantageCard(
          'assets/vigoda.png',
          'Выгода',
          'Наш сервис предлагает самые низкие цены на онлайн подписки',
          cardWidth,
          cardHeight,
          titleFontSize * 0.9,
          bodyFontSize,
        ),
        _buildAdvantageCard(
          'assets/pe.jpg',
          'Техподдержка',
          'При любых вопросах вы можете связатья с администратором',
          cardWidth,
          cardHeight,
          titleFontSize * 0.9,
          bodyFontSize,
        ),
      ],
    ),
    );
  }
  
  // Вспомогательный метод для создания колонки преимуществ (для маленьких экранов)
  Widget _buildAdvantagesColumn(
    double maxWidth,
    double screenHeight,
    double titleFontSize,
    double bodyFontSize,
  ) {
    // final cardWidth = maxWidth;
    // final cardHeight = screenHeight * 0.2;
    //
    // return Column(
    //   children: [
    //     _buildAdvantageCard(
    //       'assets/l.jpg',
    //       'Надежность',
    //       'При блокировки аккаунта выдадим вам доступ к новому!',
    //       cardWidth,
    //       cardHeight,
    //       titleFontSize * 0.9,
    //       bodyFontSize,
    //     ),
    //     SizedBox(height: screenHeight * 0.02),
    //     _buildAdvantageCard(
    //       'assets/li.jpg',
    //       'Скорость',
    //       'Наши администраторы быстро свяжутся с вами после подтверждения оплаты',
    //       cardWidth,
    //       cardHeight,
    //       titleFontSize * 0.9,
    //       bodyFontSize,
    //     ),
    //     SizedBox(height: screenHeight * 0.02),
    //     _buildAdvantageCard(
    //       'assets/pe.jpg',
    //       'Техподдержка',
    //       'При любых вопросах и сложностях вы можете связатья с администратором',
    //       cardWidth,
    //       cardHeight,
    //       titleFontSize * 0.9,
    //       bodyFontSize,
    //     ),
    //   ],
    // );
    final cardWidth = (maxWidth - 60) / 3; // 3 карточки в ряд с отступами
    final cardHeight = screenHeight * 0.25;

    return
      IntrinsicHeight(
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildAdvantageCard(
              'assets/li.jpg',
              'Скорость',
              'После оплаты вам моментально прийдут данные дла подключения подписки',
              cardWidth,
              cardHeight,
              titleFontSize * 0.9,
              bodyFontSize,
            ),
            _buildAdvantageCard(
              'assets/vigoda.png',
              'Выгода',
              'Наш сервис предлагает самые низкие цены на онлайн подписки',
              cardWidth,
              cardHeight,
              titleFontSize * 0.9,
              bodyFontSize,
            ),
            _buildAdvantageCard(
              'assets/pe.jpg',
              'Техподдержка',
              'При любых вопросах вы можете связатья с администратором',
              cardWidth,
              cardHeight,
              titleFontSize * 0.9,
              bodyFontSize,
            ),
          ],
        ),
      );
  }

  Widget _buildTelegram(double width, double height, double titleFontSize, double subtitleFontSize,BuildContext context){
    return
      Container(
        width: width,
        padding: EdgeInsets.all(width * 0.05),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 6,
              offset: Offset(0, 2),
              spreadRadius: 2,
            ),
            BoxShadow(
              color: Color(0x4C000000),
              blurRadius: 2,
              offset: Offset(0, 1),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: width*0.024),
            Container(
              height: width*0.56,
              width: width*0.56,
              child: Image.asset('assets/telegram.png'),
            ),

            Text(
              'Информация о новых\nподписках в Нашем\nТелеграм Канале!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: subtitleFontSize* 0.7,
                // fontFamily: 'Montserrat',
                // fontWeight: FontWeight.w400,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: width*0.027),
            _buildGradientButton(
              'Телеграм',
              10,
              width: width * 0.6,
              height: width* 0.17,
              fontSize: subtitleFontSize * 0.7,
              context: context,
              onPressed: () {
                _openTelegram();
                // Navigator.pushNamed(
                //   context,
                //   '/subscription',
                //   arguments: subscription,
                // );
              },
            ),
            SizedBox(height: width*0.034),
          ],
        ),
      );
  }

  // Вспомогательный метод для создания карточки подписки
  Widget _buildSubscriptionCard(
   Subscription subscription, double width, double height, double titleFontSize, double subtitleFontSize, BuildContext context) {
    return
      Container(
        width: width,
        padding: EdgeInsets.all(width * 0.05),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 6,
              offset: Offset(0, 2),
              spreadRadius: 2,
            ),
            BoxShadow(
              color: Color(0x4C000000),
              blurRadius: 2,
              offset: Offset(0, 1),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: width*0.024),
            Container(
              height: width*0.46,
              width: width*0.46,
              child: Image.asset(subscription.imagePath),
            ),
            SizedBox(height: width*0.07,),
            // Container(
            //   height: height*0.4,
            //  child:
              Text(
                subscription.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: titleFontSize,
                  fontFamily: 'Montserrat',
                  // fontWeight: FontWeight.w400,
                  fontWeight: FontWeight.w400,
                ),
              ),
           // )
           // ,

            Container(
              child:  Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Text(
                    subscription.crossprice + 'р/мес',

                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: subtitleFontSize*0.7,
                      // fontFamily: 'Montserrat',
                      // fontWeight: FontWeight.w400,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Image.asset(
                      height: height*0.1,
                      width: width*0.3,
                      'assets/crosprice.png')
                ],
              ),
            )
           ,

            SizedBox(height: width*0.014),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: subscription.price + ' ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: subtitleFontSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      //  fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'р/мес',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize : subtitleFontSize * 0.8,
                      // fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w100,
                      // fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: width*0.034),
            // _buildGradientButton(
            //   'Купить',
            //   12,
            //   width: width * 0.6,
            //   height: width* 0.17,
            //   fontSize: subtitleFontSize * 0.7,
            //   context: context,
            //   onPressed: () {
            //     Navigator.pushNamed(
            //       context,
            //       '/subscription',
            //       arguments: subscription,
            //     );
            //   },
            // ),
            Padding(
              padding: EdgeInsets.only(bottom: width * 0.034),
              child: _buildGradientButton(
                'Купить',
                12,
                width: width * 0.6,
                height: width * 0.17,
                fontSize: subtitleFontSize * 0.7,
                context: context,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/subscription',
                    arguments: subscription,
                  );
                },
              ),
            ),
            SizedBox(height: width*0.034),
          ],
        ),
      )
    ;
  }
   //   Container(
   //   width: width,
   //   height: height,
   //   padding: EdgeInsets.all(20),
   //   decoration: ShapeDecoration(
   //     color: Colors.white,
   //     shape: RoundedRectangleBorder(
   //       borderRadius: BorderRadius.circular(25),
   //     ),
   //     shadows: const [
   //       BoxShadow(
   //         color: Color(0x26000000),
   //         blurRadius: 6,
   //         offset: Offset(0, 2),
   //         spreadRadius: 2,
   //       ),
   //       BoxShadow(
   //         color: Color(0x4C000000),
   //         blurRadius: 2,
   //         offset: Offset(0, 1),
   //         spreadRadius: 0,
   //       ),
   //     ],
   //   ),
   //   child: Column(
   //     mainAxisAlignment: MainAxisAlignment.center,
   //    // mainAxisAlignment: MainAxisAlignment.center,
   //     children: [
   //     // SizedBox(height: width*0.024),
   //       Container(
   //         height: width*0.4,
   //         width: width*0.4,
   //         child: Image.asset(subscription.imagePath),
   //       ),
   //
   //       Text(
   //         subscription.title,
   //         textAlign: TextAlign.center,
   //         style: TextStyle(
   //           color: Colors.black,
   //           fontSize: titleFontSize,
   //          // fontFamily: 'Montserrat',
   //          // fontWeight: FontWeight.w400,
   //           fontWeight: FontWeight.w100,
   //         ),
   //       ),
   //       SizedBox(height: height*0.014),
   //       RichText(
   //         textAlign: TextAlign.center,
   //         text: TextSpan(
   //           children: [
   //             TextSpan(
   //               text: subscription.price + ' ',
   //               style: TextStyle(
   //                 color: Colors.black,
   //                 fontSize: subtitleFontSize,
   //                // fontFamily: 'Montserrat',
   //                 fontWeight: FontWeight.w100,
   //               //  fontWeight: FontWeight.w400,
   //               ),
   //             ),
   //             TextSpan(
   //               text: '1 месяц',
   //               style: TextStyle(
   //                 color: Colors.black,
   //                 fontSize: subtitleFontSize * 0.8,
   //                // fontFamily: 'Montserrat',
   //                 fontWeight: FontWeight.w100,
   //                // fontWeight: FontWeight.w400,
   //               ),
   //             ),
   //           ],
   //         ),
   //       ),
   //       SizedBox(height: height*0.034),
   //     SizedBox(
   //       width: double.infinity,
   //       child: _buildGradientButton(
   //         'Подробнее',
   //         height: 50,
   //         fontSize: subtitleFontSize,
   //         context: context,
   //         onPressed: () {
   //           Navigator.pushNamed(
   //             context,
   //             '/subscription',
   //             arguments: subscription,
   //           );
   //         },
   //       ),
   //     ),
   //     //  SizedBox(height: height*0.044),
   //     ],
   //   ),
   // )
  // Вспомогательный метод для создания строки подписок (для больших экранов)
  Widget _buildSubscriptionRow(
 //   double maxWidth,
      double screenWidth,
    double screenHeight,
    double titleFontSize,
    double subtitleFontSize,
    BuildContext context,
  ) {
   // final cardWidth = (maxWidth - 120) / 3; // 3 карточки в ряд с отступами

    return

    // Container(
    //   width: screenWidth,
    //   height: screenHeight*0.69,
    //   child:

      //   GridView.count(
      //     // Количество столбцов
      //     crossAxisCount: 3,
      //     // Отступы между столбцами
      //     crossAxisSpacing: 15.0,
      //     // Отступы между строками
      //     mainAxisSpacing: 25.0,
      //     // Если нужно, чтобы сетка не занимала всю высоту, а «встроилась» в контент
      //     shrinkWrap: true,
      //     // Отключаем скролл сами, если она внутри другого ScrollView
      //     physics: NeverScrollableScrollPhysics(),
      //     // Строим виджеты
      //     children: subscriptions
      //         .map((sub) => _buildSubscriptionCard(sub,screenWidth,screenHeight ,  titleFontSize, subtitleFontSize, context))
      //         .toList(),
      //   )
//
        Column(
          children: [
        IntrinsicHeight(
        child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSubscriptionCard(
                    subscriptions[0],screenWidth*0.27,screenHeight*0.34 ,  titleFontSize, subtitleFontSize, context
                ),
                _buildSubscriptionCard(
                    subscriptions[1],screenWidth*0.27,screenHeight*0.34 ,  titleFontSize, subtitleFontSize, context
                ),
                _buildSubscriptionCard(
                    subscriptions[2],screenWidth * 0.27,screenHeight*0.34,  titleFontSize, subtitleFontSize, context
                ),
              ],

            ),
        ),
        SizedBox(height: screenHeight*0.05,),
        IntrinsicHeight(
        child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSubscriptionCard(
                    subscriptions[3],screenWidth*0.27,screenHeight*0.34 ,  titleFontSize, subtitleFontSize, context
                ),
                _buildSubscriptionCard(
                    subscriptions[4],screenWidth*0.27,screenHeight*0.34 ,  titleFontSize, subtitleFontSize, context
                ),
                // _buildSubscriptionCard(
                //     subscriptions[5],screenWidth * 0.27,screenHeight*0.34,  titleFontSize, subtitleFontSize, context
                // ),
                _buildTelegram(screenWidth*0.27,screenHeight*0.34 , titleFontSize, subtitleFontSize, context)
              ],
            )
          ,)
          ],


       )
   // )
    ;
  }
  
  // Вспомогательный метод для создания колонки подписок (для маленьких экранов)
  Widget _buildSubscriptionColumn(
    double maxWidth,
    double screenHeight,
    double screenWidth,
    double titleFontSize,
    double subtitleFontSize,
    BuildContext context,
  ) {
    final cardWidth = (maxWidth - 28) / 2;

    return

    Column(
      children: [
        Row(
          children: [
            _buildSubscriptionCard(
                subscriptions[0],cardWidth,screenHeight*0.34 ,  titleFontSize, subtitleFontSize, context
            ),
            Spacer(),
            _buildSubscriptionCard(
                subscriptions[1],cardWidth,screenHeight*0.34 ,  titleFontSize, subtitleFontSize, context
            ),
          ],
        ),
        SizedBox(height: screenHeight*0.05,),
        Row(
          children: [
            _buildSubscriptionCard(
                subscriptions[2],cardWidth,screenHeight*0.34 ,  titleFontSize, subtitleFontSize, context
            ),
            Spacer(),
            _buildSubscriptionCard(
                subscriptions[3],cardWidth,screenHeight*0.34 ,  titleFontSize, subtitleFontSize, context
            ),
          ],
        ),
        SizedBox(height: screenHeight*0.03,),
        Row(
          children: [
            _buildSubscriptionCard(
                subscriptions[4],cardWidth,screenHeight*0.34 ,  titleFontSize, subtitleFontSize, context
            ),
            Spacer(),
            _buildTelegram(
                cardWidth,screenHeight*0.34 ,  titleFontSize, subtitleFontSize, context
            ),
          ],
        ),
      ],
    )
    // Container(
    //   width: screenWidth,
    //   height: screenHeight,
    //   child: GridView.count(
    //     // Количество столбцов
    //     crossAxisCount: 2,
    //     // Отступы между столбцами
    //     crossAxisSpacing: 8.0,
    //     // Отступы между строками
    //     mainAxisSpacing: 8.0,
    //     // Если нужно, чтобы сетка не занимала всю высоту, а «встроилась» в контент
    //     shrinkWrap: true,
    //     // Отключаем скролл сами, если она внутри другого ScrollView
    //     physics: NeverScrollableScrollPhysics(),
    //     // Строим виджеты
    //     children: subscriptions
    //         .map((sub) => _buildSubscriptionCard(sub,screenWidth * 0.8, screenHeight * 0.4, titleFontSize, subtitleFontSize, context))
    //         .toList(),
    //   ),
    // )
    ;
  }
}
