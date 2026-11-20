import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../theme.dart';

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({super.key});
  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  final FlutterTts flutterTts = FlutterTts();
  String selectedLang = 'en';
  
  final Map<String, String> langNames = {
    'en': '🇬🇧 English',
    'zh': '🇨🇳 中文',
    'ms': '🇲🇾 Bahasa Melayu',
    'tr': '🇹🇷 Türkçe',
    'hi': '🇮🇳 हिन्दी',
    'am': '🇪🇹 አማርኛ',
  };

  final List<Map<String, String>> phrases = [
    {'icon': '👋', 'ar': 'مرحباً', 'en': 'Hello', 'zh': '你好', 'ms': 'Helo', 'tr': 'Merhaba', 'hi': 'नमस्ते', 'am': 'ሰላም'},
    {'icon': '🙏', 'ar': 'شكراً جزيلاً', 'en': 'Thank you very much', 'zh': '非常感谢', 'ms': 'Terima kasih banyak', 'tr': 'Çok teşekkürler', 'hi': 'बहुत धन्यवाद', 'am': 'በጣም አመሰግናለሁ'},
    {'icon': '🛑', 'ar': 'عفواً / المعذرة', 'en': 'Excuse me / Sorry', 'zh': '打扰一下 / 对不起', 'ms': 'Maafkan saya', 'tr': 'Affedersiniz', 'hi': 'माफ़ कीजिए', 'am': 'አዝናለሁ / ይቅርታ'},
    {'icon': '🗣️', 'ar': 'لا أفهم', 'en': 'I do not understand', 'zh': '我不明白', 'ms': 'Saya tidak faham', 'tr': 'Anlamıyorum', 'hi': 'मैं समझा नहीं', 'am': 'አልገባኝም'},
    {'icon': '🕐', 'ar': 'كم الساعة؟', 'en': 'What time is it?', 'zh': '现在几点了？', 'ms': 'Pukul berapa sekarang?', 'tr': 'Saat kaç?', 'hi': 'कितने बजे हैं?', 'am': 'ሰዓቱ ስንት ነው?'},
    {'icon': '📍', 'ar': 'أين نحن الآن؟', 'en': 'Where are we now?', 'zh': '我们现在在哪里？', 'ms': 'Di manakah kita sekarang?', 'tr': 'Şu an neredeyiz?', 'hi': 'हम अब कहाँ हैं?', 'am': 'አሁን የት ነን?'},
    {'icon': '📶', 'ar': 'هل يوجد واي فاي في المطار؟', 'en': 'Is there Wi-Fi in the airport?', 'zh': '机场有Wi-Fi吗？', 'ms': 'Adakah terdapat Wi-Fi di lapangan terbang?', 'tr': 'Havalimanında Wi-Fi var mı?', 'hi': 'क्या हवाई अड्डे में वाई-फाई है?', 'am': 'በአውሮፕላን ማረፊያው ውስጥ ዋይፋይ አለ?'},
    {'icon': '🚕', 'ar': 'أريد تاكسي من فضلك', 'en': 'I want a taxi, please', 'zh': '请给我叫一辆出租车', 'ms': 'Saya mahu teksi, tolong', 'tr': 'Lütfen bir taksi istiyorum', 'hi': 'कृपया मुझे टैक्सी चाहिए', 'am': 'እባክዎ ታክሲ እፈልጋለሁ'},
  ];

  Future<void> speak(String text) async {
    await flutterTts.setLanguage(selectedLang == 'en' ? 'en-US' : 
                                 selectedLang == 'zh' ? 'zh-CN' : 
                                 selectedLang == 'ms' ? 'ms-MY' : 
                                 selectedLang == 'tr' ? 'tr-TR' : 
                                 selectedLang == 'hi' ? 'hi-IN' : 'am-ET');
    await flutterTts.setSpeechRate(0.9);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المترجم الفوري', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          // شريط اختيار اللغة
          Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.navy2,
            child: Row(
              children: [
                const Text('ترجمة إلى:', style: TextStyle(color: AppColors.gold2, fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      value: selectedLang,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: langNames.entries.map((e) {
                        return DropdownMenuItem(value: e.key, child: Text(e.value, style: const TextStyle(color: AppColors.navy, fontWeight: FontWeight.bold)));
                      }).toList(),
                      onChanged: (val) => setState(() => selectedLang = val!),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // قائمة العبارات
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: phrases.length,
              itemBuilder: (context, index) {
                final phrase = phrases[index];
                final translatedText = phrase[selectedLang] ?? phrase['en']!;
                
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFE2E8F2)),
                    boxShadow: [BoxShadow(color: AppColors.navy.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: () => speak(translatedText),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(color: AppColors.bg, borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text(phrase['icon']!, style: const TextStyle(fontSize: 22)),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(phrase['ar']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.navy)),
                                const SizedBox(height: 6),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(color: AppColors.bg, borderRadius: BorderRadius.circular(8)),
                                  child: Text(translatedText, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.navy2)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.volume_up, color: AppColors.gold, size: 24),
                        ],
                      ),
                    ),
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
