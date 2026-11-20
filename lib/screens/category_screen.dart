import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../theme.dart';
import '../data/phrases_data.dart';

class CategoryScreen extends StatefulWidget {
  final String title;
  final List<Phrase> phrases;

  const CategoryScreen({super.key, required this.title, required this.phrases});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
        title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // شريط اختيار اللغة
          Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.navy2,
            child: Row(
              children: [
                const Text('ترجمة إلى:', style: TextStyle(color: AppColors.gold2, fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
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
              itemCount: widget.phrases.length,
              itemBuilder: (context, index) {
                final phrase = widget.phrases[index];
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
