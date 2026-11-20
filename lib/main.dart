import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/translator_screen.dart';

void main() {
  runApp(const TransitApp());
}

class TransitApp extends StatelessWidget {
  const TransitApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Mate',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const MainNavigationScreen(),
    );
  }
}

// ================= الشاشة الرئيسية مع التبويبات السفلية =================
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});
  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  // قائمة الشاشات التي ستظهر عند الضغط على التبويبات السفلية
  final List<Widget> _screens = [
    const HomeScreenContent(), // الشاشة الرئيسية
    const TranslatorScreen(),  // المترجم
    const TravelStepsScreen(), // خطوات السفر
    const TransitCalculatorScreen(), // الحاسبة
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.navy,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.translate), label: 'ترجمة'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_walk), label: 'الخطوات'),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'الحاسبة'),
        ],
      ),
    );
  }
}

// ================= محتوى الشاشة الرئيسية =================
class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // الهيدر الكحلي
          SliverAppBar(
            expandedHeight: 120.0,
            floating: false,
            pinned: true,
            backgroundColor: AppColors.navy,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.gold,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.explore, color: AppColors.navy, size: 20),
                  ),
                  const SizedBox(width: 10),
                  const Text('Travel Mate', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
                ],
              ),
              centerTitle: true,
            ),
          ),
          
          // محتوى الشاشة
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const Text('أهلاً بك، مسافر 👋', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.navy)),
                const SizedBox(height: 4),
                const Text('اختر القسم الذي تحتاجه', style: TextStyle(fontSize: 13, color: Colors.grey)),
                const SizedBox(height: 16),
                
                // شبكة البطاقات (Grid)
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.1,
                  children: [
                    _buildGateCard(context, 'الأساسيات', 'تحيات، وقت، أرقام', Icons.abc, AppColors.gold, AppColors.navy, isGold: true),
                    _buildGateCard(context, 'المطار والطيران', 'تسجيل، حقائب', Icons.flight, AppColors.navy, AppColors.white),
                    _buildGateCard(context, 'الجوازات', 'تأشيرات وتفتيش', Icons.passport, AppColors.navy, AppColors.white),
                    _buildGateCard(context, 'التاكسي', 'مواصلات', Icons.local_taxi, AppColors.navy, AppColors.white),
                    _buildGateCard(context, 'الفندق', 'حجز وغرف', Icons.hotel, AppColors.navy, AppColors.white),
                    _buildGateCard(context, 'الطوارئ', 'صحة ومساعدة', Icons.medical_services, AppColors.navy, AppColors.white),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGateCard(BuildContext context, String title, String sub, IconData icon, Color bgColor, Color textColor, {bool isGold = false}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: isGold ? [AppColors.gold, const Color(0xFFB8952E)] : [AppColors.navy, AppColors.navy2],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: bgColor.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // سيتم ربط هذه البطاقات بالشاشات لاحقاً
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('قريباً: $title')));
          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: textColor, size: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 15)),
                    const SizedBox(height: 2),
                    Text(sub, style: TextStyle(color: textColor.withOpacity(0.7), fontSize: 11)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================= 3. شاشة خطوات السفر (نفس التصميم السابق) =================
class TravelStepsScreen extends StatelessWidget {
  const TravelStepsScreen({super.key});

  final List<Map<String, dynamic>> steps = const [
    {'title': '1. من البيت إلى المطار', 'desc': 'احجز تاكسي. غادر قبل 3 ساعات.', 'icon': Icons.local_taxi},
    {'title': '2. كاونتر الحجز', 'desc': 'قدم جواز السفر، وزن الحقائب، استلم كرت الصعود.', 'icon': Icons.badge},
    {'title': '3. الجوازات', 'desc': 'قدم جوازك للموظف ليضع ختم الخروج.', 'icon': Icons.credit_card},
    {'title': '4. التفتيش الأمني', 'desc': 'ضع أغراضك في الصينية ومر عبر الأشعة.', 'icon': Icons.security},
    {'title': '5. صالة الانتظار', 'desc': 'اذهب لبوابتك (Gate) وراقب الشاشات.', 'icon': Icons.airline_seat_recline_normal},
    {'title': '6. الصعود للطائرة', 'desc': 'قدم كرت الصعود واصعد.', 'icon': Icons.airplanemode_active},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('خطوات السفر')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: steps.length,
        itemBuilder: (context, index) {
          final step = steps[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.navy.withOpacity(0.1),
                child: Icon(step['icon'], color: AppColors.navy),
              ),
              title: Text(step['title'], style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(step['desc']),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ================= 4. شاشة الحاسبة (نفس التصميم السابق) =================
class TransitCalculatorScreen extends StatefulWidget {
  const TransitCalculatorScreen({super.key});
  @override
  State<TransitCalculatorScreen> createState() => _TransitCalculatorScreenState();
}

class _TransitCalculatorScreenState extends State<TransitCalculatorScreen> {
  final Map<String, Map<String, dynamic>> airports = {
    'أديس أبابا (ADD)': {'minConnection': 45, 'freeHotel': 8, 'note': 'فندق مجاني للخطوط الإثيوبية إذا الترانزيت 8-24 ساعة'},
    'الدوحة (DOH)': {'minConnection': 60, 'freeHotel': 0, 'note': 'جولة مدينة مجانية إذا الترانزيت ≥ 6 ساعات'},
    'إسطنبول (IST)': {'minConnection': 90, 'freeHotel': 0, 'note': 'احذر: المطار بعيد 40 كم عن المدينة'},
  };

  String selectedAirport = 'أديس أبابا (ADD)';
  TimeOfDay? arrival;
  TimeOfDay? departure;

  Future<void> pickTime(bool isArrival) async {
    final t = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (t != null) {
      setState(() {
        if (isArrival) { arrival = t; } else { departure = t; }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حاسبة الترانزيت')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      value: selectedAirport,
                      decoration: const InputDecoration(labelText: 'اختر مطار الترانزيت', border: OutlineInputBorder()),
                      items: airports.keys.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                      onChanged: (v) => setState(() => selectedAirport = v!),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.flight_land),
                            onPressed: () => pickTime(true), 
                            label: Text(arrival == null ? 'وصول' : arrival!.format(context)),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.flight_takeoff),
                            onPressed: () => pickTime(false), 
                            label: Text(departure == null ? 'مغادرة' : departure!.format(context)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.gold, foregroundColor: AppColors.navy),
                      icon: const Icon(Icons.calculate),
                      label: const Text('احسب التوصية'),
                      onPressed: (arrival != null && departure != null) ? () => _calculate(context) : null,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _calculate(BuildContext context) {
    int arrMin = arrival!.hour * 60 + arrival!.minute;
    int depMin = departure!.hour * 60 + departure!.minute;
    if (depMin <= arrMin) depMin += 24 * 60;
    double hours = (depMin - arrMin) / 60.0;
    
    final data = airports[selectedAirport]!;
    String recommendation;
    
    if (hours < (data['minConnection'] as int) / 60) {
      recommendation = '⚠️ وقت الترانزيت قصير جداً! الحد الأدنى ${data['minConnection']} دقيقة.';
    } else if ((data['freeHotel'] as int) > 0 && hours >= (data['freeHotel'] as int)) {
      recommendation = '🏨 يمكنك الحصول على فندق مجاني! ${data['note']}';
    } else if (hours >= 6) {
      recommendation = '💡 ${data['note']}';
    } else {
      recommendation = '✅ ابق في منطقة الترانزيت بأمان. ${data['note']}';
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('الوقت الصافي: ${hours.toStringAsFixed(1)} ساعة'),
        content: Text(recommendation),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('حسناً'))],
      ),
    );
  }
}
