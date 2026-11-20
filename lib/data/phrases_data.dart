class Phrase {
  final String icon;
  final String ar;
  final String en;
  final String zh;
  final String ms;
  final String tr;
  final String hi;
  final String am;

  const Phrase({
    required this.icon,
    required this.ar,
    required this.en,
    required this.zh,
    required this.ms,
    required this.tr,
    required this.hi,
    required this.am,
  });

  String getText(String langCode) {
    switch (langCode) {
      case 'zh': return zh;
      case 'ms': return ms;
      case 'tr': return tr;
      case 'hi': return hi;
      case 'am': return am;
      default: return en;
    }
  }
}

class PhrasesData {
  static const List<Phrase> basics = [
    Phrase(icon: '👋', ar: 'مرحباً', en: 'Hello', zh: '你好', ms: 'Helo', tr: 'Merhaba', hi: 'नमस्ते', am: 'ሰላም'),
    Phrase(icon: '🙏', ar: 'شكراً جزيلاً', en: 'Thank you very much', zh: '非常感谢', ms: 'Terima kasih banyak', tr: 'Çok teşekkürler', hi: 'बहुत धन्यवाद', am: 'በጣም አመሰግናለሁ'),
    Phrase(icon: '🤝', ar: 'من فضلك', en: 'Please', zh: '请', ms: 'Tolong', tr: 'Lütfen', hi: 'कृपया', am: 'እባክዎ'),
    Phrase(icon: '🛑', ar: 'عفواً / المعذرة', en: 'Excuse me / Sorry', zh: '打扰一下', ms: 'Maafkan saya', tr: 'Affedersiniz', hi: 'माफ़ कीजिए', am: 'አዝናለሁ'),
    Phrase(icon: '✅', ar: 'نعم', en: 'Yes', zh: '是的', ms: 'Ya', tr: 'Evet', hi: 'हाँ', am: 'አዎ'),
    Phrase(icon: '❌', ar: 'لا', en: 'No', zh: '不', ms: 'Tidak', tr: 'Hayır', hi: 'नहीं', am: 'አይ'),
    Phrase(icon: '❓', ar: 'هل تتحدث الإنجليزية؟', en: 'Do you speak English?', zh: '你会说英语吗？', ms: 'Adakah anda bercakap Bahasa Inggeris?', tr: 'İngilizce biliyor musunuz?', hi: 'क्या आप अंग्रेज़ी बोलते हैं?', am: 'እንግሊዝኛ ትናገራለህ?'),
    Phrase(icon: '🗣️', ar: 'لا أفهم', en: 'I do not understand', zh: '我不明白', ms: 'Saya tidak faham', tr: 'Anlamıyorum', hi: 'मैं समझा नहीं', am: 'አልገባኝም'),
    Phrase(icon: '⏳', ar: 'انتظر لحظة من فضلك', en: 'Wait a moment, please', zh: '请稍等', ms: 'Tunggu sebentar, tolong', tr: 'Bir dakika bekleyin, lütfen', hi: 'कृपया एक पल रुकें', am: 'እባክዎ ትንሽ ይጠብቁ'),
    Phrase(icon: '✍️', ar: 'هل يمكنك كتابتها لي؟', en: 'Can you write it down for me?', zh: '你能帮我写下来吗？', ms: 'Bolehkah anda menulisnya untuk saya?', tr: 'Benim için yazabilir misiniz?', hi: 'क्या आप इसे मेरे लिए लिख सकते हैं?', am: 'ሊጽፉልኝ ይችላሉ?'),
    Phrase(icon: '🕐', ar: 'كم الساعة؟', en: 'What time is it?', zh: '现在几点了？', ms: 'Pukul berapa sekarang?', tr: 'Saat kaç?', hi: 'कितने बजे हैं?', am: 'ሰዓቱ ስንት ነው?'),
    Phrase(icon: '📅', ar: 'ما هو اليوم؟', en: 'What day is it today?', zh: '今天星期几？', ms: 'Hari apa hari ini?', tr: 'Bugün günlerden ne?', hi: 'आज कौन सा दिन है?', am: 'ዛሬ ምን ቀን ነው?'),
    Phrase(icon: '📍', ar: 'أين نحن الآن؟', en: 'Where are we now?', zh: '我们现在在哪里？', ms: 'Di manakah kita sekarang?', tr: 'Şu an neredeyiz?', hi: 'हम अब कहाँ हैं?', am: 'አሁን የት ነን?'),
    Phrase(icon: '🔢', ar: 'واحد، اثنان، ثلاثة', en: 'One, two, three', zh: '一，二，三', ms: 'Satu, dua, tiga', tr: 'Bir, iki, üç', hi: 'एक, दो, तीन', am: 'አንድ, ሁለት, ሶስት'),
    Phrase(icon: '💯', ar: 'مئة، ألف', en: 'One hundred, one thousand', zh: '一百，一千', ms: 'Seratus, seribu', tr: 'Yüz, bin', hi: 'एक सौ, एक हज़ार', am: 'መቶ, ሺህ'),
    Phrase(icon: '⏱️', ar: 'أنا مستعجل', en: 'I am in a hurry', zh: '我赶时间', ms: 'Saya tergesa-gesa', tr: 'Acelem var', hi: 'मुझे जल्दी है', am: 'ቸኵቤ አለብኝ'),
    Phrase(icon: '🤔', ar: 'لست متأكداً', en: 'I am not sure', zh: '我不确定', ms: 'Saya tidak pasti', tr: 'Emin değilim', hi: 'मुझे यकीन नहीं है', am: 'እርግጠኛ አልሆንኩም'),
    Phrase(icon: '☎️', ar: 'هل يمكنني استخدام هاتفك؟', en: 'Can I use your phone?', zh: '我能用一下你的手机吗？', ms: 'Bolehkah saya menggunakan telefon anda?', tr: 'Telefonunuzu kullanabilir miyim?', hi: 'क्या मैं आपका फोन इस्तेमाल कर सकता हूँ?', am: 'ስልክዎን መጠቀም እችላለሁ?'),
    Phrase(icon: '👋', ar: 'إلى اللقاء', en: 'Goodbye', zh: '再见', ms: 'Selamat tinggal', tr: 'Hoşça kalın', hi: 'अलविदा', am: 'ደህና ሁን'),
  ];

  static const List<Phrase> airport = [
    Phrase(icon: '🎫', ar: 'أين مكتب تسجيل الوصول؟', en: 'Where is the check-in counter?', zh: '办理登机手续的柜台在哪里？', ms: 'Di manakah kaunter daftar masuk?', tr: 'Check-in bankosu nerede?', hi: 'चेक-इन काउंटर कहाँ है?', am: 'የመመዝገቢያ ቦታው የት ነው?'),
    Phrase(icon: '🎟️', ar: 'أريد تذكرة ذهاب وعودة', en: 'I want a round-trip ticket', zh: '我要一张往返票', ms: 'Saya mahu tiket pergi balik', tr: 'Gidiş-dönüş bilet istiyorum', hi: 'मुझे राउंड-ट्रिप टिकट चाहिए', am: 'የመሄጃ እና መመለሻ ቲኬት እፈልጋለሁ'),
    Phrase(icon: '🛄', ar: 'أين استلام الحقائب؟', en: 'Where is baggage claim?', zh: '行李提取处在哪里？', ms: 'Di manakah tuntutan bagasi?', tr: 'Bagaj alım yeri nerede?', hi: 'बैगेज क्लेम कहाँ है?', am: 'የሻንጣ መውሰጃው የት ነው?'),
    Phrase(icon: '❌', ar: 'لقد فقدت حقيبتي', en: 'I lost my luggage', zh: '我的行李丢了', ms: 'Saya kehilangan bagasi', tr: 'Bagajımı kaybettim', hi: 'मेरा सामान खो गया', am: 'ሻንጣዬ ጠፍቷል'),
    Phrase(icon: '🧳', ar: 'هل هذه الحقيبة اليدوية مسموحة؟', en: 'Is this carry-on allowed?', zh: '这个手提行李允许带上飞机吗？', ms: 'Adakah bagasi tangan ini dibenarkan?', tr: 'Bu el bagajına izin var mı?', hi: 'क्या यह हैंड बैगेज की अनुमति है?', am: 'ይህ የእጅ ሻንጣ ይፈቀዳል?'),
    Phrase(icon: '🚪', ar: 'أين البوابة رقم 12؟', en: 'Where is Gate 12?', zh: '12号登机口在哪里？', ms: 'Di manakah Pintu 12?', tr: '12 numaralı kapı nerede?', hi: 'गेट 12 कहाँ है?', am: 'በር 12 የት ነው?'),
    Phrase(icon: '🔄', ar: 'أين مكتب الترانزيت؟', en: 'Where is the transit desk?', zh: '转机柜台在哪里？', ms: 'Di manakah kaunter transit?', tr: 'Transit masası nerede?', hi: 'पारगमन डेस्क कहाँ है?', am: 'የትራንዚት ዴስክ የት ነው?'),
    Phrase(icon: '🕒', ar: 'هل الرحلة متأخرة؟', en: 'Is the flight delayed?', zh: '航班延误了吗？', ms: 'Adakah penerbangan ditangguhkan?', tr: 'Uçuş rötarlı mı?', hi: 'क्या उड़ान में देरी है?', am: 'በረራው ዘግይቷል?'),
    Phrase(icon: '💺', ar: 'أريد مقعداً بجانب النافذة', en: 'I want a window seat', zh: '我想要一个靠窗的座位', ms: 'Saya mahu tempat duduk tepi tingkap', tr: 'Cam kenarı koltuk istiyorum', hi: 'मुझे खिड़की के पास सीट चाहिए', am: 'የመስኮት ወንበር እፈልጋለሁ'),
    Phrase(icon: '💺', ar: 'أريد مقعداً على الممر', en: 'I want an aisle seat', zh: '我想要一个靠过道的座位', ms: 'Saya mahu tempat duduk lorong', tr: 'Koridor tarafı koltuk istiyorum', hi: 'मुझे गलियारे के पास सीट चाहिए', am: 'የአቅጣጫ ወንበር እፈልጋለሁ'),
    Phrase(icon: '🥤', ar: 'هل يمكنني الحصول على ماء؟', en: 'Can I have some water?', zh: '能给我点水吗？', ms: 'Bolehkah saya dapatkan air?', tr: 'Biraz su alabilir miyim?', hi: 'क्या मुझे थोड़ा पानी मिल सकता है?', am: 'ውሃ ማግኘት እችላለሁ?'),
    Phrase(icon: '📶', ar: 'هل يوجد واي فاي في المطار؟', en: 'Is there Wi-Fi in the airport?', zh: '机场有Wi-Fi吗？', ms: 'Adakah terdapat Wi-Fi di lapangan terbang?', tr: 'Havalimanında Wi-Fi var mı?', hi: 'क्या हवाई अड्डे में वाई-फाई है?', am: 'በአውሮፕላን ማረፊያው ውስጥ ዋይፋይ አለ?'),
  ];

  static const List<Phrase> passport = [
    Phrase(icon: '🛂', ar: 'جواز سفري هنا', en: 'Here is my passport', zh: '这是我的护照', ms: 'Ini pasport saya', tr: 'Pasaportum burada', hi: 'यह मेरा पासपोर्ट है', am: 'ይህ የእኔ ፓስፖርት ነው'),
    Phrase(icon: '✈️', ar: 'أنا هنا للسياحة', en: 'I am here for tourism', zh: '我是来旅游的', ms: 'Saya di sini untuk pelancongan', tr: 'Buraya turizm için geldim', hi: 'मैं यहाँ पर्यटन के लिए हूँ', am: 'እኔ ለቱሪዝም ነኝ'),
    Phrase(icon: '💼', ar: 'أنا هنا للعمل', en: 'I am here for business', zh: '我是来出差的', ms: 'Saya di sini untuk perniagaan', tr: 'Buraya iş için geldim', hi: 'मैं यहाँ व्यापार के लिए हूँ', am: 'እኔ ለንግድ ነኝ'),
    Phrase(icon: '🕒', ar: 'سأبقى لمدة أسبوع', en: 'I will stay for one week', zh: '我将停留一周', ms: 'Saya akan tinggal selama seminggu', tr: 'Bir hafta kalacağım', hi: 'मैं एक सप्ताह रहूँगा', am: 'ለአንድ ሳምንት እቆያለሁ'),
    Phrase(icon: '🏨', ar: 'سأقيم في هذا الفندق', en: 'I will stay at this hotel', zh: '我将住在这家酒店', ms: 'Saya akan tinggal di hotel ini', tr: 'Bu otelde kalacağım', hi: 'मैं इस होटल में रहूँगा', am: 'በዚህ ሆቴል እቆያለሁ'),
    Phrase(icon: '🚫', ar: 'لا يوجد شيء للإفصاح عنه', en: 'Nothing to declare', zh: '没有需要申报的物品', ms: 'Tiada apa-apa untuk diisytiharkan', tr: 'Beyan edecek bir şey yok', hi: 'घोषित करने के लिए कुछ नहीं है', am: 'የሚገለጽ ነገር የለም'),
    Phrase(icon: '💊', ar: 'لدي أدوية شخصية', en: 'I have personal medication', zh: '我有个人药品', ms: 'Saya mempunyai ubat peribadi', tr: 'Kişisel ilaçlarım var', hi: 'मेरे पास व्यक्तिगत दवाएं हैं', am: 'የግል መድኃኒቶች አሉኝ'),
    Phrase(icon: '🍎', ar: 'هل يمكنني إحضار الفواكه؟', en: 'Can I bring fruits?', zh: '我可以带水果吗？', ms: 'Bolehkah saya membawa buah-buahan?', tr: 'Meyve getirebilir miyim?', hi: 'क्या मैं फल ला सकता हूँ?', am: 'ፍራፍሬ ማምጣት እችላለሁ?'),
    Phrase(icon: '💵', ar: 'أين أدفع رسوم التأشيرة؟', en: 'Where do I pay the visa fee?', zh: '我在哪里支付签证费？', ms: 'Di manakah saya bayar yuran visa?', tr: 'Vize ücretini nerede ödeyeceğim?', hi: 'मैं वीज़ा शुल्क कहाँ चुकाऊँ?', am: 'የቪዛ ክፍያውን የት እከፍላለሁ?'),
    Phrase(icon: '🖐️', ar: 'أين آخذ بصماتي؟', en: 'Where do I get my fingerprints taken?', zh: '我在哪里录入指纹？', ms: 'Di manakah saya boleh ambil cap jari?', tr: 'Parmak izlerimi nerede vereceğim?', hi: 'मैं अपने फिंगरप्रिंट कहाँ दूँ?', am: 'የጣት አሻራዬን የት አስወጣለሁ?'),
  ];

  static const List<Phrase> taxi = [
    Phrase(icon: '🚕', ar: 'هل أنت متاح؟', en: 'Are you available?', zh: '你有空吗？', ms: 'Adakah anda tersedia?', tr: 'Müsait misiniz?', hi: 'क्या आप उपलब्ध हैं?', am: 'ነጻ ነዎት?'),
    Phrase(icon: '📍', ar: 'خذني إلى هذا العنوان', en: 'Take me to this address', zh: '带我去这个地址', ms: 'Bawa saya ke alamat ini', tr: 'Beni bu adrese götürün', hi: 'मुझे इस पते पर ले चलो', am: 'ወደዚህ አድራሻ ውሰደኝ'),
    Phrase(icon: '🗺️', ar: 'هل يمكنك تشغيل العداد؟', en: 'Can you turn on the meter?', zh: '你能打表吗？', ms: 'Bolehkah anda pasang meter?', tr: 'Taksimetreyi açar mısınız?', hi: 'क्या आप मीटर चालू कर सकते हैं?', am: 'ሜትሩን ልታበሩልኝ ትችላለህ?'),
    Phrase(icon: '✈️', ar: 'كم يكلف الوصول إلى المطار؟', en: 'How much to the airport?', zh: '去机场多少钱？', ms: 'Berapa ke lapangan terbang?', tr: 'Havalimanına ne kadar?', hi: 'हवाई अड्डे तक कितना?', am: 'ወደ አውሮፕላን ማረፊያ ስንት ነው?'),
    Phrase(icon: '🛑', ar: 'توقف هنا من فضلك', en: 'Stop here, please', zh: '请在这里停车', ms: 'Berhenti di sini, tolong', tr: 'Lütfen burada durun', hi: 'कृपया यहाँ रुकें', am: 'እባክዎ እዚህ ያቁሩ'),
    Phrase(icon: '⏱️', ar: 'أنا مستعجل، أسرع من فضلك', en: 'I am in a hurry, please hurry', zh: '我赶时间，请快点', ms: 'Saya tergesa-gesa, sila cepat', tr: 'Acelem var, lütfen acele edin', hi: 'मुझे जल्दी है, कृपया जल्दी करें', am: 'ቸኵቤ አለብኝ፣ እባክዎ ይፍጠኑ'),
    Phrase(icon: '💳', ar: 'هل يمكنني الدفع بالبطاقة؟', en: 'Can I pay by card?', zh: '我可以用卡支付吗？', ms: 'Bolehkah saya bayar dengan kad?', tr: 'Kartla ödeyebilir miyim?', hi: 'क्या मैं कार्ड से भुगतान कर सकता हूँ?', am: 'በካርድ መክፈል እችላለሁ?'),
    Phrase(icon: '🧾', ar: 'أحتاج إلى فاتورة', en: 'I need a receipt', zh: '我需要一张收据', ms: 'Saya perlukan resit', tr: 'Fişe ihtiyacım var', hi: 'मुझे रसीद चाहिए', am: 'ደረሰኝ እፈልጋለሁ'),
    Phrase(icon: '🧳', ar: 'هل يمكنك مساعدتي في حمل الحقيبة؟', en: 'Can you help me with the luggage?', zh: '你能帮我拿行李吗？', ms: 'Bolehkah anda tolong saya dengan bagasi?', tr: 'Bagajımla bana yardım edebilir misiniz?', hi: 'क्या आप सामान में मेरी मदद कर सकते हैं?', am: 'በሻንጣዬ ሊረዱኝ ይችላሉ?'),
    Phrase(icon: '🚉', ar: 'أين أقرب محطة مترو؟', en: 'Where is the nearest metro station?', zh: '最近的地铁站在哪里？', ms: 'Di manakah stesen metro terdekat?', tr: 'En yakın metro istasyonu nerede?', hi: 'निकटतम मेट्रो स्टेशन कहाँ है?', am: 'የቅርቡ የሜትሮ ጣቢያ የት ነው?'),
    Phrase(icon: '🚌', ar: 'أين محطة الحافلات؟', en: 'Where is the bus station?', zh: '公交车站在哪里？', ms: 'Di manakah stesen bas?', tr: 'Otobüs durağı nerede?', hi: 'बस स्टेशन कहाँ है?', am: 'የአውቶቡስ ጣቢያው የት ነው?'),
  ];

  static const List<Phrase> hotel = [
    Phrase(icon: '🔑', ar: 'لدي حجز باسم...', en: 'I have a reservation under...', zh: '我有一个预订，名字是...', ms: 'Saya mempunyai tempahan di bawah...', tr: '... adına rezervasyonum var', hi: 'मेरे नाम पर आरक्षण है...', am: 'በ... ስም ቦታ አስይዤያለሁ'),
    Phrase(icon: '🛏️', ar: 'أريد غرفة لشخصين', en: 'I want a double room', zh: '我要一间双人房', ms: 'Saya mahu bilik dua orang', tr: 'Çift kişilik oda istiyorum', hi: 'मुझे डबल रूम चाहिए', am: 'ሁለት አልጋ ያለው ክፍል እፈልጋለሁ'),
    Phrase(icon: '📶', ar: 'ما هي كلمة سر الواي فاي؟', en: 'What is the Wi-Fi password?', zh: 'Wi-Fi密码是多少？', ms: 'Apakah kata laluan Wi-Fi?', tr: 'Wi-Fi şifresi nedir?', hi: 'वाई-फाई का पासवर्ड क्या है?', am: 'የዋይፋይ የይለፍ ቃል ምንድነው?'),
    Phrase(icon: '🕐', ar: 'متى موعد تسجيل المغادرة؟', en: 'What time is check-out?', zh: '退房时间是几点？', ms: 'Pukul berapa daftar keluar?', tr: 'Çıkış saati kaçta?', hi: 'चेक-आउट का समय क्या है?', am: 'የመውጫ ሰዓቱ ስንት ነው?'),
    Phrase(icon: '🧳', ar: 'هل يمكنك حفظ حقائبي؟', en: 'Can you keep my luggage?', zh: '你能帮我保管行李吗？', ms: 'Bolehkah anda simpan bagasi saya?', tr: 'Bagajımı saklayabilir misiniz?', hi: 'क्या आप मेरा सामान रख सकते हैं?', am: 'ሻንጣዬን ማስቀመጥ ይችላሉ?'),
    Phrase(icon: '🚿', ar: 'المكيف لا يعمل', en: 'The air conditioner is not working', zh: '空调坏了', ms: 'Penghawa dingin tidak berfungsi', tr: 'Klima çalışmıyor', hi: 'एयर कंडीशनर काम नहीं कर रहा है', am: 'ኤር ኮንዲሽነሩ አይሰራም'),
    Phrase(icon: '🧼', ar: 'أحتاج المزيد من المناشف', en: 'I need more towels', zh: '我需要更多的毛巾', ms: 'Saya perlukan lebih banyak tuala', tr: 'Daha fazla havluya ihtiyacım var', hi: 'मुझे और तौलिये चाहिए', am: 'ተጨማሪ ፎጣ እፈልጋለሁ'),
    Phrase(icon: '🍳', ar: 'هل الإفطار مشمول؟', en: 'Is breakfast included?', zh: '包含早餐吗？', ms: 'Adakah sarapan termasuk?', tr: 'Kahvaltı dahil mi?', hi: 'क्या नाश्ता शामिल है?', am: 'ቁርስ ተካቷል?'),
    Phrase(icon: '⏰', ar: 'أريد طلب إيقاظ', en: 'I would like a wake-up call', zh: '我想要叫醒服务', ms: 'Saya mahu panggilan bangun', tr: 'Alarm hizmeti istiyorum', hi: 'मुझे वेक-अप कॉल चाहिए', am: 'የማንቂያ ጥሪ እፈልጋለሁ'),
    Phrase(icon: '🧹', ar: 'هل يمكن تنظيف الغرفة؟', en: 'Can the room be cleaned?', zh: '房间能打扫一下吗？', ms: 'Bolehkah bilik dibersihkan?', tr: 'Oda temizlenebilir mi?', hi: 'क्या कमरा साफ किया जा सकता है?', am: 'ክፍሉ ሊጸዳ ይችላል?'),
    Phrase(icon: '💰', ar: 'هل هناك رسوم إضافية؟', en: 'Are there any extra fees?', zh: '有额外费用吗？', ms: 'Adakah terdapat bayaran tambahan?', tr: 'Ekstra ücret var mı?', hi: 'क्या कोई अतिरिक्त शुल्क है?', am: 'ተጨማሪ ክፍያ አለ?'),
  ];

  static const List<Phrase> money = [
    Phrase(icon: '💱', ar: 'أين أقرب مكتب صرافة؟', en: 'Where is the nearest exchange office?', zh: '最近的货币兑换处在哪里？', ms: 'Di manakah pusat tukaran wang terdekat?', tr: 'En yakın döviz bürosu nerede?', hi: 'निकटतम मुद्रा विनिमय कार्यालय कहाँ है?', am: 'የቅርቡ የገንዘብ ልውውጥ ቢሮ የት ነው?'),
    Phrase(icon: '💵', ar: 'أريد تحويل الدولار إلى العملة المحلية', en: 'I want to exchange dollars to local currency', zh: '我想把美元兑换成当地货币', ms: 'Saya mahu tukar dolar kepada mata wang tempatan', tr: 'Doları yerel para birimine çevirmek istiyorum', hi: 'मैं डॉलर को स्थानीय मुद्रा में बदलना चाहता हूँ', am: 'ዶላርን ወደ አገር ውስጥ ገንዘብ መቀየር እፈልጋለሁ'),
    Phrase(icon: '📈', ar: 'ما هو سعر الصرف اليوم؟', en: 'What is the exchange rate today?', zh: '今天的汇率是多少？', ms: 'Apakah kadar tukaran hari ini?', tr: 'Bugünkü döviz kuru nedir?', hi: 'आज विनिमय दर क्या है?', am: 'የዛሬው የምንዛሬ ተመን ስንት ነው?'),
    Phrase(icon: '💳', ar: 'هل هناك رسوم على السحب؟', en: 'Are there withdrawal fees?', zh: '有取款手续费吗？', ms: 'Adakah terdapat bayaran pengeluaran?', tr: 'Para çekme ücreti var mı?', hi: 'क्या निकासी शुल्क है?', am: 'የገንዘብ ማውጫ ክፍያ አለ?'),
    Phrase(icon: '🏧', ar: 'أين أقرب صراف آلي (ATM)؟', en: 'Where is the nearest ATM?', zh: '最近的自动取款机在哪里？', ms: 'Di manakah ATM terdekat?', tr: 'En yakın ATM nerede?', hi: 'निकटतम एटीएम कहाँ है?', am: 'የቅርቡ ኤቲኤም የት ነው?'),
    Phrase(icon: '🧾', ar: 'هل يمكنني الحصول على إيصال؟', en: 'Can I get a receipt?', zh: '能给我一张收据吗？', ms: 'Bolehkah saya dapatkan resit?', tr: 'Fiş alabilir miyim?', hi: 'क्या मुझे रसीद मिल सकती है?', am: 'ደረሰኝ ማግኘት እችላለሁ?'),
    Phrase(icon: '🪙', ar: 'هل لديك فكة؟', en: 'Do you have change?', zh: '你有零钱吗？', ms: 'Adakah anda mempunyai wang kecil?', tr: 'Bozuk paranız var mı?', hi: 'क्या आपके पास खुल्ले पैसे हैं?', am: 'ተለዋዋጭ ሳንቲም አለዎት?'),
    Phrase(icon: '💳', ar: 'هل تقبلون بطاقة فيزا؟', en: 'Do you accept Visa?', zh: '你们接受Visa卡吗？', ms: 'Adakah anda menerima Visa?', tr: 'Visa kabul ediyor musunuz?', hi: 'क्या आप वीज़ा स्वीकार करते हैं?', am: 'ቪዛ ትቀበላላችሁ?'),
    Phrase(icon: '📱', ar: 'هل يمكنني الدفع عبر الهاتف؟', en: 'Can I pay by phone?', zh: '我可以用手机支付吗？', ms: 'Bolehkah saya bayar melalui telefon?', tr: 'Telefonla ödeyebilir miyim?', hi: 'क्या मैं फोन से भुगतान कर सकता हूँ?', am: 'በስልክ መክፈል እችላለሁ?'),
    Phrase(icon: '💰', ar: 'أريد فئات صغيرة من العملة', en: 'I want small denominations', zh: '我想要小面额的钞票', ms: 'Saya mahu wang kertas kecil', tr: 'Küçük banknotlar istiyorum', hi: 'मुझे छोटे मूल्यवर्ग चाहिए', am: 'ትናንሽ የገንዘብ እንደራሴዎች እፈልጋለሁ'),
  ];

  static const List<Phrase> restaurant = [
    Phrase(icon: '🍽️', ar: 'طاولة لشخصين من فضلك', en: 'A table for two, please', zh: '请给两人安排一张桌子', ms: 'Meja untuk dua orang, tolong', tr: 'İki kişilik bir masa, lütfen', hi: 'कृपया दो लोगों के लिए एक मेज', am: 'ለሁለት ሰዎች ጠረጴዛ እባክዎ'),
    Phrase(icon: '📋', ar: 'أريد قائمة الطعام', en: 'I would like the menu', zh: '我想要菜单', ms: 'Saya mahu menu', tr: 'Menüyü istiyorum', hi: 'मुझे मेन्यू चाहिए', am: 'ምናሌውን እፈልጋለሁ'),
    Phrase(icon: '🍽️', ar: 'هل هذا الطبق حلال؟', en: 'Is this dish halal?', zh: '这道菜是清真的吗？', ms: 'Adakah hidangan ini halal?', tr: 'Bu yemek helal mi?', hi: 'क्या यह व्यंजन हलाल है?', am: 'ይህ ምግብ ሃላል ነው?'),
    Phrase(icon: '🥩', ar: 'بدون لحم من فضلك', en: 'No meat, please', zh: '请不要放肉', ms: 'Tanpa daging, tolong', tr: 'Lütsuz, lütfen', hi: 'कृपया बिना मांस के', am: 'ያለ ስጋ እባክዎ'),
    Phrase(icon: '🌶️', ar: 'غير حار من فضلك', en: 'Not spicy, please', zh: '请不要辣', ms: 'Tidak pedas, tolong', tr: 'Acı olmasın, lütfen', hi: 'कृपया मसालेदार नहीं', am: 'ቅመም የሌለው እባክዎ'),
    Phrase(icon: '💧', ar: 'ماء بدون غاز', en: 'Still water', zh: '白开水', ms: 'Air tanpa gas', tr: 'Gazsız su', hi: 'सादा पानी', am: 'ጋዝ የሌለው ውሃ'),
    Phrase(icon: '🧾', ar: 'الحساب من فضلك', en: 'The bill, please', zh: '请结账', ms: 'Bil, tolong', tr: 'Hesap, lütfen', hi: 'कृपया बिल दें', am: 'ሂሳቡን እባክዎ'),
    Phrase(icon: '☕', ar: 'قهوة سوداء من فضلك', en: 'Black coffee, please', zh: '请给我黑咖啡', ms: 'Kopi hitam, tolong', tr: 'Sade kahve, lütfen', hi: 'कृपया ब्लैक कॉफी', am: 'ጥቁር ቡና እባክዎ'),
    Phrase(icon: '🍚', ar: 'هل يمكنني الحصول على الأرز؟', en: 'Can I have some rice?', zh: '能给我来点米饭吗？', ms: 'Bolehkah saya dapatkan nasi?', tr: 'Biraz pirinç alabilir miyim?', hi: 'क्या मुझे थोड़ा चावल मिल सकता है?', am: 'ሩዝ ማግኘት እችላለሁ?'),
    Phrase(icon: '🥗', ar: 'أريد طبقاً نباتياً', en: 'I want a vegetarian dish', zh: '我想要一道素菜', ms: 'Saya mahu hidangan vegetarian', tr: 'Vejetaryen bir yemek istiyorum', hi: 'मुझे शाकाहारी व्यंजन चाहिए', am: 'የአትክልት ምግብ እፈልጋለሁ'),
    Phrase(icon: '🤧', ar: 'لدي حساسية من المكسرات', en: 'I am allergic to nuts', zh: '我对坚果过敏', ms: 'Saya alah kepada kacang', tr: 'Kuruyemişe alerjim var', hi: 'मुझे मेवों से एलर्जी है', am: 'ለለውዝ አለርጂ አለብኝ'),
    Phrase(icon: '📦', ar: 'هل يمكنني أخذ الباقي معي؟', en: 'Can I take the rest to go?', zh: '我可以把剩下的打包带走吗？', ms: 'Bolehkah saya bungkus bakinya?', tr: 'Kalanı paket yapabilir miyim?', hi: 'क्या मैं बाकी पैक कर सकता हूँ?', am: 'የተረፈውን ይዤ ልሄድ እችላለሁ?'),
  ];

  static const List<Phrase> shopping = [
    Phrase(icon: '🛒', ar: 'أين أجد هذا المنتج؟', en: 'Where can I find this product?', zh: '我在哪里可以找到这个产品？', ms: 'Di manakah saya boleh cari produk ini?', tr: 'Bu ürünü nerede bulabilirim?', hi: 'मुझे यह उत्पाद कहाँ मिलेगा?', am: 'ይህንን ምርት የት ላገኘው እችላለሁ?'),
    Phrase(icon: '💰', ar: 'هل يمكنك تخفيض السعر؟', en: 'Can you lower the price?', zh: '你能便宜点吗？', ms: 'Bolehkah anda kurangkan harga?', tr: 'Fiyatı düşürebilir misiniz?', hi: 'क्या आप कीमत कम कर सकते हैं?', am: 'ዋጋውን ልትቀንሱልኝ ትችላላችሁ?'),
    Phrase(icon: '📏', ar: 'هل لديك مقاس أكبر / أصغر؟', en: 'Do you have a larger / smaller size?', zh: '你们有更大/更小的尺寸吗？', ms: 'Adakah anda mempunyai saiz yang lebih besar / kecil?', tr: 'Daha büyük / küçük bedeniniz var mı?', hi: 'क्या आपके पास बड़ा / छोटा आकार है?', am: 'ትልቅ / ትንሽ ልክ አለዎት?'),
    Phrase(icon: '💳', ar: 'هل تقبلون البطاقات الائتمانية؟', en: 'Do you accept credit cards?', zh: '你们接受信用卡吗？', ms: 'Adakah anda menerima kad kredit?', tr: 'Kredi kartı kabul ediyor musunuz?', hi: 'क्या आप क्रेडिट कार्ड स्वीकार करते हैं?', am: 'ክሬዲት ካርድ ትቀበላላችሁ?'),
    Phrase(icon: '🛍️', ar: 'أحتاج كيس من فضلك', en: 'I need a bag, please', zh: '请给我一个袋子', ms: 'Saya perlukan beg, tolong', tr: 'Bir poşet, lütfen', hi: 'कृपया एक बैग चाहिए', am: 'እባክዎ ሻንጣ እፈልጋለሁ'),
    Phrase(icon: '👕', ar: 'أريد تجربة هذا القميص', en: 'I want to try this shirt on', zh: '我想试穿这件衬衫', ms: 'Saya mahu mencuba baju ini', tr: 'Bu gömleği denemek istiyorum', hi: 'मैं यह शर्ट पहनकर देखना चाहता हूँ', am: 'ይህን ሸሚዝ መሞከር እፈልጋለሁ'),
    Phrase(icon: '👟', ar: 'أين غرفة القياس؟', en: 'Where is the fitting room?', zh: '试衣间在哪里？', ms: 'Di manakah bilik persalinan?', tr: 'Deneme kabini nerede?', hi: 'फिटिंग रूम कहाँ है?', am: 'የመለበሻ ክፍል የት ነው?'),
    Phrase(icon: '🔄', ar: 'هل يمكنني استبداله؟', en: 'Can I exchange it?', zh: '我可以换货吗？', ms: 'Bolehkah saya menukarnya?', tr: 'Değiştirebilir miyim?', hi: 'क्या मैं इसे बदल सकता हूँ?', am: 'ልቀይረው እችላለሁ?'),
    Phrase(icon: '🧾', ar: 'هل يمكنني إرجاعه؟', en: 'Can I return it?', zh: '我可以退货吗？', ms: 'Bolehkah saya memulangkannya?', tr: 'İade edebilir miyim?', hi: 'क्या मैं इसे वापस कर सकता हूँ?', am: 'መመለስ እችላለሁ?'),
    Phrase(icon: '🎁', ar: 'هل يمكنك تغليفه كهدية؟', en: 'Can you gift wrap it?', zh: '你能把它包成礼物吗？', ms: 'Bolehkah anda balut sebagai hadiah?', tr: 'Hediye olarak paketleyebilir misiniz?', hi: 'क्या आप इसे उपहार में लपेट सकते हैं?', am: 'እንደ ስጦታ ሊጠቀልሉት ይችላሉ?'),
  ];

  static const List<Phrase> sim = [
    Phrase(icon: '📱', ar: 'أين يمكنني شراء شريحة اتصال؟', en: 'Where can I buy a SIM card?', zh: '我在哪里可以买到SIM卡？', ms: 'Di manakah saya boleh beli kad SIM?', tr: 'Nereden SIM kart alabilirim?', hi: 'मैं सिम कार्ड कहाँ से खरीद सकता हूँ?', am: 'ሲም ካርድ የት መግዛት እችላለሁ?'),
    Phrase(icon: '📶', ar: 'ما هي باقات الإنترنت المتاحة؟', en: 'What internet packages are available?', zh: '有哪些互联网套餐？', ms: 'Apakah pakej internet yang tersedia?', tr: 'Hangi internet paketleri mevcut?', hi: 'कौन से इंटरनेट पैकेज उपलब्ध हैं?', am: 'የበይነመረብ ጥቅሎች ምን አሉ?'),
    Phrase(icon: '🔋', ar: 'أين يمكنني شحن هاتفي؟', en: 'Where can I charge my phone?', zh: '我在哪里可以给手机充电？', ms: 'Di manakah saya boleh mengecas telefon?', tr: 'Telefonumu nerede şarj edebilirim?', hi: 'मैं अपना फोन कहाँ चार्ज कर सकता हूँ?', am: 'ስልኬን የት ማሞራት እችላለሁ?'),
    Phrase(icon: '🔑', ar: 'ما هي كلمة سر الواي فاي؟', en: 'What is the Wi-Fi password?', zh: 'Wi-Fi密码是多少？', ms: 'Apakah kata laluan Wi-Fi?', tr: 'Wi-Fi şifresi nedir?', hi: 'वाई-फाई का पासवर्ड क्या है?', am: 'የዋይፋይ የይለፍ ቃል ምንድነው?'),
    Phrase(icon: '🔌', ar: 'هل لديك شاحن؟', en: 'Do you have a charger?', zh: '你有充电器吗？', ms: 'Adakah anda mempunyai pengecas?', tr: 'Şarj aletiniz var mı?', hi: 'क्या आपके पास चार्जर है?', am: 'ቻርጀር አለዎት?'),
    Phrase(icon: '📞', ar: 'أحتاج إلى إجراء مكالمة دولية', en: 'I need to make an international call', zh: '我需要打一个国际电话', ms: 'Saya perlu membuat panggilan antarabangsa', tr: 'Uluslararası bir arama yapmam gerekiyor', hi: 'मुझे अंतर्राष्ट्रीय कॉल करनी है', am: 'ዓለም አቀፍ ጥሪ ማድረግ እፈልጋለሁ'),
    Phrase(icon: '📡', ar: 'هل التغطية جيدة هنا؟', en: 'Is the coverage good here?', zh: '这里的信号好吗？', ms: 'Adakah liputan baik di sini?', tr: 'Burada çekim iyi mi?', hi: 'क्या यहाँ कवरेज अच्छा है?', am: 'እዚህ ሽፋኑ ጥሩ ነው?'),
    Phrase(icon: '💻', ar: 'أين يمكنني استخدام الكمبيوتر؟', en: 'Where can I use a computer?', zh: '我在哪里可以使用电脑？', ms: 'Di manakah saya boleh menggunakan komputer?', tr: 'Bilgisayarı nerede kullanabilirim?', hi: 'मैं कंप्यूटर कहाँ इस्तेमाल कर सकता हूँ?', am: 'ኮምፒውተር የት መጠቀም እችላለሁ?'),
  ];

  static const List<Phrase> emergency = [
    Phrase(icon: '🚨', ar: 'أحتاج مساعدة طبية فورية', en: 'I need immediate medical help', zh: '我需要立即医疗帮助', ms: 'Saya perlukan bantuan perubatan segera', tr: 'Acil tıbbi yardıma ihtiyacım var', hi: 'मुझे तत्काल चिकित्सा सहायता चाहिए', am: 'አስቸኳይ የህክምና እርዳታ እፈልጋለሁ'),
    Phrase(icon: '🏥', ar: 'أين أقرب مستشفى؟', en: 'Where is the nearest hospital?', zh: '最近的医院在哪里？', ms: 'Di manakah hospital terdekat?', tr: 'En yakın hastane nerede?', hi: 'निकटतम अस्पताल कहाँ है?', am: 'የቅርቡ ሆስፒታል የት ነው?'),
    Phrase(icon: '💊', ar: 'أين أقرب صيدلية؟', en: 'Where is the nearest pharmacy?', zh: '最近的药店在哪里？', ms: 'Di manakah farmasi terdekat?', tr: 'En yakın eczane nerede?', hi: 'निकटतम फार्मेसी कहाँ है?', am: 'የቅርቡ ፋርማሲ የት ነው?'),
    Phrase(icon: '🤒', ar: 'أشعر بالحمى', en: 'I have a fever', zh: '我发烧了', ms: 'Saya demam', tr: 'Ateşim var', hi: 'मुझे बुखार है', am: 'ትኩሳት አለብኝ'),
    Phrase(icon: '💊', ar: 'أحتاج إلى مسكن للألم', en: 'I need a painkiller', zh: '我需要止痛药', ms: 'Saya perlukan ubat penahan sakit', tr: 'Ağrı kesiciye ihtiyacım var', hi: 'मुझे दर्द निवारक चाहिए', am: 'ህመም ማስታገሻ እፈልጋለሁ'),
    Phrase(icon: '🤕', ar: 'أشعر بألم هنا', en: 'I feel pain here', zh: '我这里痛', ms: 'Saya rasa sakit di sini', tr: 'Burada ağrı hissediyorum', hi: 'मुझे यहाँ दर्द है', am: 'እዚህ ህመም ይሰማኛል'),
    Phrase(icon: '🤢', ar: 'أشعر بالغثيان', en: 'I feel nauseous', zh: '我感到恶心', ms: 'Saya rasa loya', tr: 'Midem bulanıyor', hi: 'मुझे मतली आ रही है', am: 'ማቅለሽለሽ ይሰማኛል'),
    Phrase(icon: '🚑', ar: 'اتصل بالإسعاف', en: 'Call an ambulance', zh: '叫救护车', ms: 'Panggil ambulans', tr: 'Ambulans çağırın', hi: 'एम्बुलेंस बुलाओ', am: 'አምቡላንስ ይጥሩ'),
    Phrase(icon: '🚓', ar: 'اتصل بالشرطة', en: 'Call the police', zh: '报警', ms: 'Panggil polis', tr: 'Polisi arayın', hi: 'पुलिस को बुलाओ', am: 'ፖሊስ ይጥሩ'),
    Phrase(icon: '🛂', ar: 'لقد فقدت جواز سفري', en: 'I lost my passport', zh: '我的护照丢了', ms: 'Saya hilang pasport', tr: 'Pasaportumu kaybettim', hi: 'मेरा पासपोर्ट खो गया है', am: 'ፓስፖርቴን አጣሁ'),
    Phrase(icon: '👮', ar: 'أريد الاتصال بسفارتي', en: 'I want to contact my embassy', zh: '我想联系我的大使馆', ms: 'Saya mahu menghubungi kedutaan saya', tr: 'Büyükelçiliğimle iletişime geçmek istiyorum', hi: 'मैं अपने दूतावास से संपर्क करना चाहता हूँ', am: 'ኤምባሲዬን ማግኘት እፈልጋለሁ'),
  ];
}
