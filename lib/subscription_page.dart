import 'package:flutter/material.dart';
import 'package:langing_test/subscription_model.dart';

class SubscriptionPage extends StatefulWidget {
  final Subscription subscription;

  const SubscriptionPage({Key? key, required this.subscription}) : super(key: key);

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  int selectedPlan = 0; // 0 - месяц, 1 - 3 месяца, 2 - год
  bool autoRenew = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(widget.subscription.title),
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isDesktop = constraints.maxWidth > 768;

            if (isDesktop) {
              return _buildDesktopLayout();
            } else {
              return _buildMobileLayout();
            }
          },
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child:
      SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Левая колонка с информацией о приложении
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAppInfo(),
                  const SizedBox(height: 32),
                  _buildAccountInfo(),
                ],
              ),
            ),
            const SizedBox(width: 32),
            // Правая колонка с подпиской
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSubscriptionSection(),
                  const SizedBox(height: 24),
                  _buildRulesSection(),
                  const SizedBox(height: 16),
                  _buildDescriptionSection(),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAppInfo(),
          const SizedBox(height: 24),
          _buildSubscriptionSection(),
          const SizedBox(height: 24),
          _buildAccountInfo(),
          const SizedBox(height: 24),
          _buildRulesSection(),
          const SizedBox(height: 16),
          _buildDescriptionSection(),
        ],
      ),
    );
  }

  Widget _buildAppInfo() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Center(
                  child: Image.asset(widget.subscription.imagePath),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.subscription.title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const Text(
                      'Активно до 20.08.2008',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Продлить подписку',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(height: 20),
          _buildPlanSelector(),
          const SizedBox(height: 20),
          _buildSelectedPlanCard(),
        ],
      ),
    );
  }

  Widget _buildPlanSelector() {
    return Row(
      children: [
        _buildPlanButton('На месяц', 0),
        const SizedBox(width: 8),
        _buildPlanButton('На 3 месяца', 1),
        const SizedBox(width: 8),
        _buildPlanButton('На год', 2),
      ],
    );
  }

  Widget _buildPlanButton(String text, int index) {
    bool isSelected = selectedPlan == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedPlan = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: ShapeDecoration(
            gradient: isSelected
                ? const LinearGradient(
              begin: Alignment(0.31, 0.66),
              end: Alignment(1.15, 0.69),
              colors: [Color(0xFF2146C2), Color(0xCC40B0FF)],
            )
                : null,
            color: isSelected ? null : Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: isSelected ? BorderSide.none : BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade700,
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedPlanCard() {
    String planTitle = selectedPlan == 0 ? 'На месяц' : selectedPlan == 1 ? 'На 3 месяца' : 'На год';
    String price = selectedPlan == 0 ? '380 ₽' : selectedPlan == 1 ? '1080 ₽' : '4320 ₽';

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                planTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'до 20.08.2008',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                value: autoRenew,
                onChanged: (value) {
                  setState(() {
                    autoRenew = value ?? false;
                  });
                },
                activeColor: const Color(0xFF4285F4),
              ),
              const Text(
                'Продлять автоматически',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                print('Кнопка Оформить нажата!');
              },
              child: Container(
                height: 50, // Примерная высота кнопки
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(0.31, 0.66),
                    end: Alignment(1.15, 0.69),
                    colors: [Color(0xFF2146C2), Color(0xCC40B0FF)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Используем 8, так как height/4 может быть слишком большим
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Оформить',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Данные доступа на аккаунт:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: 'Montserrat',
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Почта: radixlevil@gmail.com',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontFamily: 'Montserrat',
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Пароль: Chatgpt1234@',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontFamily: 'Montserrat',
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Text(
              'Код доступа: ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontFamily: 'Montserrat',
              ),
            ),
            const Text(
              '069113',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontFamily: 'Montserrat',
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton(
              onPressed: () {
                print('Кнопка Обновить нажата!');
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF4285F4)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: const Text(
                'Обновить',
                style: TextStyle(
                  color: Color(0xFF4285F4),
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRulesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Правила пользования',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: 'Montserrat',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.subscription.description, // Используем описание из объекта подписки
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            height: 1.5,
            fontFamily: 'Montserrat',
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Описание',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: 'Montserrat',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.subscription.description, // Используем описание из объекта подписки
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            height: 1.5,
            fontFamily: 'Montserrat',
          ),
        ),
      ],
    );
  }
}


