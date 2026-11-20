import 'package:flutter/material.dart';

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({super.key});
  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  final List<Map<String, String>> phrases = [
    {'ar': 'أين مكتب الحجز؟', 'en': 'Where is the check-in counter?', 'tr': 'Check-in bankosu nerede?', 'am': 'የቼክ-ኢን ቆጣሪው የሚገኘው የት ነው?', 'zh': '值机柜台在哪里？', 'ms': 'Di manakah kaunter daftar masuk?', 'hi': 'चेक-इन काउंटर कहाँ है?'},
    {'ar': 'أريد تسجيل حقيبتي', 'en': 'I want to check in my bag.', 'tr': 'Bavulumu kayıt ettirmek istiyorum.', 'am': 'ቦርሳዬን ማስመዝገብ እፈልጋለሁ።', 'zh': '我想托运行李。', 'ms': 'Saya mahu mendaftar masuk beg saya.', 'hi': 'मैं अपना बैग चेक-इन करना चाहता हूं।'},
    {'ar': 'أين بوابة رقم (X)؟', 'en': 'Where is gate number (X)?', 'tr': '(X) numaralı kapı nerede?', 'am': 'በር ቁጥር (X) የሚገኘው የት ነው?', 'zh': '(X)号登机口在哪里？', 'ms': 'Di manakah pintu nombor (X)?', 'hi': 'गेट नंबर (X) कहाँ है?'},
    {'ar': 'هل رحلتي متأخرة؟', 'en': 'Is my flight delayed?', 'tr': 'Uçuşum rötarlı mı?', 'am': 'በረራዬ ዘግይቷል?', 'zh': '我的航班延误了吗？', 'ms': 'Adakah penerbangan saya lewat?', 'hi': 'क्या मेरी उड़ान में देरी है?'},
    {'ar': 'أين دورة المياه؟', 'en': 'Where is the restroom?', 'tr': 'Tuvalet nerede?', 'am': 'ሽንት ቤቱ የሚገኘው የት ነው?', 'zh': '洗手间在哪里？', 'ms': 'Di manakah tandas?', 'hi': 'शौचालय कहाँ है?'},
    {'ar': 'أحتاج إلى مساعدة طبية', 'en': 'I need medical assistance.', 'tr': 'Tıbbi yardıma ihtiyacım var.', 'am': 'የህክምና እርዳታ እፈልጋለሁ።', 'zh': '我需要医疗救助。', 'ms': 'Saya perlukan bantuan perubatan.', 'hi': 'मुझे चिकित्सा सहायता की आवश्यकता है।'},
  ];

  String selectedLang = 'en'; 
  final Map<String, String> langNames = {
    'en': 'الإنجليزية 🇬🇧',
    'tr': 'التركية 🇹🇷',
    'am': 'الأمهرية (إثيوبيا) 🇪🇹',
    'zh': 'الصينية 🇨🇳',
    'ms': 'الماليزية 🇲🇾',
    'hi': 'الهندية 🇮🇳',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المترجم الفوري')),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.teal.shade50,
            child: Row(
              children: [
                const Text('ترجمة إلى: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedLang,
                    isExpanded: true,
                    items: langNames.entries.map((e) {
                      return DropdownMenuItem(value: e.key, child: Text(e.value));
                    }).toList(),
                    onChanged: (val) {
                      setState(() => selectedLang = val!);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: phrases.length,
              itemBuilder: (context, index) {
                final phrase = phrases[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ExpansionTile(
                    title: Text(phrase['ar']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.teal)),
                    subtitle: Text(phrase['en']!, style: const TextStyle(fontSize: 14)),
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        color: Colors.grey.shade100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('الترجمة (${langNames[selectedLang]}):', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                            const SizedBox(height: 8),
                            Text(
                              phrase[selectedLang]!,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
