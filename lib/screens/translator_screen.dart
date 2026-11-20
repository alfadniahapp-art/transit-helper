import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../theme.dart';
import '../data/phrases_data.dart';

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({super.key});
  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  final FlutterTts flutterTts = FlutterTts();
  String selectedLang = 'en';
  double speechRate = 0.8; // سرعة النطق الافتراضية

  final Map<String, String> langNames = {
    'en': '🇬🇧 English',
    'zh': '🇨🇳 中文',
    'ms': '🇲🇾 Bahasa Melayu',
    'tr': '🇹🇷 Türkçe',
    'hi': '🇮🇳 हिन्दी',
    'am': '🇪🇹 አማርኛ',
  };

  @override
  void initState() {
    super.initState();
    flutterTts.setSpeechRate(speechRate);
  }

  Future<void> speak(String text) async {
    await flutterTts.setLanguage(selectedLang == 'en' ? 'en-US' : 
                                 selectedLang == 'zh' ? 'zh-CN' : 
                                 selectedLang == 'ms' ? 'ms-MY' : 
                                 selectedLang == 'tr' ? 'tr-TR' : 
                                 selectedLang == 'hi' ? 'hi-IN' : 'am-ET');
    await flutterTts.setSpeechRate(speechRate);
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: AppColors.navy2,
            child: Row(
              children: [
                const Text('اللغة:', style: TextStyle(color: AppColors.gold2, fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
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

          // شريط التحكم في سرعة القراءة
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            color: AppColors.navy2,
            child: Row(
              children: [
                const Icon(Icons.speed, color: AppColors.gold2, size: 20),
                const SizedBox(width: 8),
                const Text('السرعة:', style: TextStyle(color: AppColors.gold2, fontSize: 12, fontWeight: FontWeight.bold)),
                Expanded(
                  child: Slider(
                    value: speechRate,
                    min: 0.3,
                    max: 1.5,
                    divisions: 12,
                    activeColor: AppColors.gold,
                    inactiveColor: Colors.white30,
                    label: speechRate.toStringAsFixed(1),
                    onChanged: (val) {
                      setState(() => speechRate = val);
                      flutterTts.setSpeechRate(speechRate);
                    },
                  ),
                ),
                Text(speechRate.toStringAsFixed(1), style: const TextStyle(color: AppColors.white, fontSize: 12)),
              ],
            ),
          ),

          // قائمة العبارات
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: PhrasesData.basics.length,
              itemBuilder: (context, index) {
                final phrase = PhrasesData.basics[index];
                final translatedText = phrase.getText(selectedLang);

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
                            child: Text(phrase.icon, style: const TextStyle(fontSize: 22)),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(phrase.ar, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.navy)),
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
