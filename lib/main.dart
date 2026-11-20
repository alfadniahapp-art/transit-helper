import 'package:flutter/material.dart';

void main() => runApp(const TransitApp());

class TransitApp extends StatelessWidget {
  const TransitApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مساعد الترانزيت',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const AirportScreen(),
    );
  }
}

final airports = {
  'أديس أبابا (ADD)': {
    'minConnection': 45,
    'freeHotel': 8,
    'note': 'فندق مجاني للخطوط الإثيوبية إذا الترانزيت 8-24 ساعة',
  },
  'الدوحة (DOH)': {
    'minConnection': 60,
    'freeHotel': 0,
    'note': 'جولة مدينة مجانية إذا الترانزيت ≥ 6 ساعات',
  },
  'إسطنبول (IST)': {
    'minConnection': 90,
    'freeHotel': 0,
    'note': 'احذر: المطار بعيد 40 كم عن المدينة',
  },
};

class AirportScreen extends StatelessWidget {
  const AirportScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اختر مطار الترانزيت')),
      body: ListView(
        children: airports.keys.map((name) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.flight_land, color: Colors.teal),
              title: Text(name),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TimeScreen(airportName: name),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class TimeScreen extends StatefulWidget {
  final String airportName;
  const TimeScreen({super.key, required this.airportName});
  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  TimeOfDay? arrival;
  TimeOfDay? departure;

  Future<void> pickTime(bool isArrival) async {
    final t = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (t != null) {
      setState(() {
        if (isArrival) {
          arrival = t;
        } else {
          departure = t;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.airportName)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => pickTime(true),
              child: Text(arrival == null
                  ? 'وقت الوصول'
                  : 'الوصول: ${arrival!.format(context)}'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => pickTime(false),
              child: Text(departure == null
                  ? 'وقت المغادرة'
                  : 'المغادرة: ${departure!.format(context)}'),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.calculate),
              label: const Text('احسب التوصية'),
              onPressed: (arrival != null && departure != null)
                  ? () => _calculate(context)
                  : null,
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

    final data = airports[widget.airportName]!;
    String recommendation;

    if (hours < (data['minConnection'] as int) / 60) {
      recommendation =
          '⚠️ وقت الترانزيت قصير جداً! الحد الأدنى ${data['minConnection']} دقيقة.';
    } else if ((data['freeHotel'] as int) > 0 &&
        hours >= (data['freeHotel'] as int)) {
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
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('حسناً'),
          ),
        ],
      ),
    );
  }
}
