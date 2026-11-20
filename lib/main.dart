import 'package:flutter/material.dart';
import 'screens/translator_screen.dart';

void main() {
  runApp(const TransitApp());
}

class TransitApp extends StatelessWidget {
  const TransitApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مرشد المسافر',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomeScreen(),
    );
  }
}

// ================= الشاشة الرئيسية =================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مرشد المسافر الذكي'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildMainCard(
              context,
              title: 'خطوات السفر من البيت للمطار',
              icon: Icons.directions_walk,
              color: Colors.blueAccent,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TravelStepsScreen())),
            ),
            const SizedBox(height: 16),
            _buildMainCard(
              context,
              title: 'المترجم الفوري لموظفي المطار',
              icon: Icons.translate,
              color: Colors.orange,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TranslatorScreen())),
            ),
            const SizedBox(height: 16),
            _buildMainCard(
              context,
              title: 'حاسبة وقت الترانزيت',
              icon: Icons.timer,
              color: Colors.teal,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TransitCalculatorScreen())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainCard(BuildContext context, {required String title, required IconData icon, required Color color, required VoidCallback onTap}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= 1. شاشة خطوات السفر =================
class TravelStepsScreen extends StatelessWidget {
  const TravelStepsScreen({super.key});

  final List<Map<String, dynamic>> steps = const [
    {'title': '1. من البيت إلى المطار', 'desc': 'احجز سيارة أجرة (تاكسي) أو استخدم تطبيق نقل. تأكد من مغادرة البيت قبل 3 ساعات من موعد الرحلة.', 'icon': Icons.local_taxi},
    {'title': '2. الوصول لصالة المغادرة', 'desc': 'ابحث عن شاشة الرحلات لمعرفة رقم كاونتر شركة الطيران الخاصة بك.', 'icon': Icons.flight_takeoff},
    {'title': '3. كاونتر الحجز (Check-in)', 'desc': 'قابل موظف الحجز. قدم جواز السفر. سيقوم الموظف بوزن حقائبك وتسليمك كرت الصعود (Boarding Pass).', 'icon': Icons.badge},
    {'title': '4. وزن الأمتعة (Baggage Drop)', 'desc': 'إذا كانت حقيبتك أكبر من المقاس المسموح، سيقوم الموظف بأخذها لتوضع في الطائرة (احتفظ بالتغسيلة).', 'icon': Icons.luggage},
    {'title': '5. الجوازات (Passport Control)', 'desc': 'قف في طابور الجوازات. قدم جواز السفر وبطاقة الصعود للموظف ليضع ختم الخروج.', 'icon': Icons.credit_card},
    {'title': '6. التفتيش الأمني (Security)', 'desc': 'ضع حزامك، هاتفك، والسوائل في الصينية. مر عبر جهاز الأشعة السينية.', 'icon': Icons.security},
    {'title': '7. صالة الانتظار (Gate)', 'desc': 'اذهب إلى رقم البوابة (Gate) المكتوب على بطاقة الصعود. راقب الشاشات لموعد الإقلاع.', 'icon': Icons.airline_seat_recline_normal},
    {'title': '8. الصعود للطائرة (Boarding)', 'desc': 'قدم بطاقة الصعود للموظف واصعد للطائرة.', 'icon': Icons.airplanemode_active},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('خطوات السفر')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: steps.length,
        itemBuilder: (context, index) {
          final step = steps[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: Icon(step['icon'], color: Colors.teal),
              ),
              title: Text(step['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(step['desc']),
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}

// ================= 3. شاشة حاسبة الترانزيت =================
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedAirport,
              decoration: const InputDecoration(labelText: 'اختر مطار الترانزيت', border: OutlineInputBorder()),
              items: airports.keys.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => selectedAirport = v!),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: ElevatedButton(onPressed: () => pickTime(true), child: Text(arrival == null ? 'وقت الوصول' : 'الوصول: ${arrival!.format(context)}'))),
                const SizedBox(width: 10),
                Expanded(child: ElevatedButton(onPressed: () => pickTime(false), child: Text(departure == null ? 'وقت المغادرة' : 'المغادرة: ${departure!.format(context)}'))),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              icon: const Icon(Icons.calculate),
              label: const Text('احسب التوصية'),
              onPressed: (arrival != null && departure != null) ? () => _calculate(context) : null,
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
