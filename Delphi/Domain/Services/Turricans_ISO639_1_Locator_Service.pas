unit Turricans_ISO639_1_Locator_Service;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  ISO639_Exceptions,
  ISO639_1_Locator_Service;

type
  TFastISO639_1_Locator = class(TInterfacedObject, IISO639_1_Locator_Service)
    type
      TISO639_1 = record
        Code : array[0..2] of Char;
        Name : string;
      end;

    const
      ISO639_1_TYPES : array[1..184] of TISO639_1 =
      (
        (Code : 'ab'; Name : 'Abkhaz'),
        (Code : 'aa'; Name : 'Afar'),
        (Code : 'af'; Name : 'Afrikaans'),
        (Code : 'ak'; Name : 'Akan'),
        (Code : 'sq'; Name : 'Albanian'),
        (Code : 'am'; Name : 'Amharic'),
        (Code : 'ar'; Name : 'Arabic'),
        (Code : 'an'; Name : 'Aragonese'),
        (Code : 'hy'; Name : 'Armenian'),
        (Code : 'as'; Name : 'Assamese'),
        (Code : 'av'; Name : 'Avaric'),
        (Code : 'ae'; Name : 'Avestan'),
        (Code : 'ay'; Name : 'Aymara'),
        (Code : 'az'; Name : 'Azerbaijani'),
        (Code : 'bm'; Name : 'Bambara'),
        (Code : 'ba'; Name : 'Bashkir'),
        (Code : 'eu'; Name : 'Basque'),
        (Code : 'be'; Name : 'Belarusian'),
        (Code : 'bn'; Name : 'Bengali'),
        (Code : 'bh'; Name : 'Bihari'),
        (Code : 'bi'; Name : 'Bislama'),
        (Code : 'bs'; Name : 'Bosnian'),
        (Code : 'br'; Name : 'Breton'),
        (Code : 'bg'; Name : 'Bulgarian'),
        (Code : 'my'; Name : 'Burmese'),
        (Code : 'ca'; Name : 'Catalan; Valencian'),
        (Code : 'ch'; Name : 'Chamorro'),
        (Code : 'ce'; Name : 'Chechen'),
        (Code : 'ny'; Name : 'Chichewa; Chewa; Nyanja'),
        (Code : 'zh'; Name : 'Chinese'),
        (Code : 'cv'; Name : 'Chuvash'),
        (Code : 'kw'; Name : 'Cornish'),
        (Code : 'co'; Name : 'Corsican'),
        (Code : 'cr'; Name : 'Cree'),
        (Code : 'hr'; Name : 'Croatian'),
        (Code : 'cs'; Name : 'Czech'),
        (Code : 'da'; Name : 'Danish'),
        (Code : 'dv'; Name : 'Divehi; Maldivian;'),
        (Code : 'nl'; Name : 'Dutch'),
        (Code : 'dz'; Name : 'Dzongkha'),
        (Code : 'en'; Name : 'English'),
        (Code : 'eo'; Name : 'Esperanto'),
        (Code : 'et'; Name : 'Estonian'),
        (Code : 'ee'; Name : 'Ewe'),
        (Code : 'fo'; Name : 'Faroese'),
        (Code : 'fj'; Name : 'Fijian'),
        (Code : 'fi'; Name : 'Finnish'),
        (Code : 'fr'; Name : 'French'),
        (Code : 'ff'; Name : 'Fula'),
        (Code : 'gl'; Name : 'Galician'),
        (Code : 'ka'; Name : 'Georgian'),
        (Code : 'de'; Name : 'German'),
        (Code : 'el'; Name : 'Greek, Modern'),
        (Code : 'gn'; Name : 'Guaraní'),
        (Code : 'gu'; Name : 'Gujarati'),
        (Code : 'ht'; Name : 'Haitian'),
        (Code : 'ha'; Name : 'Hausa'),
        (Code : 'he'; Name : 'Hebrew (modern)'),
        (Code : 'hz'; Name : 'Herero'),
        (Code : 'hi'; Name : 'Hindi'),
        (Code : 'ho'; Name : 'Hiri Motu'),
        (Code : 'hu'; Name : 'Hungarian'),
        (Code : 'ia'; Name : 'Interlingua'),
        (Code : 'id'; Name : 'Indonesian'),
        (Code : 'ie'; Name : 'Interlingue'),
        (Code : 'ga'; Name : 'Irish'),
        (Code : 'ig'; Name : 'Igbo'),
        (Code : 'ik'; Name : 'Inupiaq'),
        (Code : 'io'; Name : 'Ido'),
        (Code : 'is'; Name : 'Icelandic'),
        (Code : 'it'; Name : 'Italian'),
        (Code : 'iu'; Name : 'Inuktitut'),
        (Code : 'ja'; Name : 'Japanese'),
        (Code : 'jv'; Name : 'Javanese'),
        (Code : 'kl'; Name : 'Kalaallisut'),
        (Code : 'kn'; Name : 'Kannada'),
        (Code : 'kr'; Name : 'Kanuri'),
        (Code : 'ks'; Name : 'Kashmiri'),
        (Code : 'kk'; Name : 'Kazakh'),
        (Code : 'km'; Name : 'Khmer'),
        (Code : 'ki'; Name : 'Kikuyu, Gikuyu'),
        (Code : 'rw'; Name : 'Kinyarwanda'),
        (Code : 'ky'; Name : 'Kirghiz, Kyrgyz'),
        (Code : 'kv'; Name : 'Komi'),
        (Code : 'kg'; Name : 'Kongo'),
        (Code : 'ko'; Name : 'Korean'),
        (Code : 'ku'; Name : 'Kurdish'),
        (Code : 'kj'; Name : 'Kwanyama, Kuanyama'),
        (Code : 'la'; Name : 'Latin'),
        (Code : 'lb'; Name : 'Luxembourgish'),
        (Code : 'lg'; Name : 'Luganda'),
        (Code : 'li'; Name : 'Limburgish'),
        (Code : 'ln'; Name : 'Lingala'),
        (Code : 'lo'; Name : 'Lao'),
        (Code : 'lt'; Name : 'Lithuanian'),
        (Code : 'lu'; Name : 'Luba-Katanga'),
        (Code : 'lv'; Name : 'Latvian'),
        (Code : 'gv'; Name : 'Manx'),
        (Code : 'mk'; Name : 'Macedonian'),
        (Code : 'mg'; Name : 'Malagasy'),
        (Code : 'ms'; Name : 'Malay'),
        (Code : 'ml'; Name : 'Malayalam'),
        (Code : 'mt'; Name : 'Maltese'),
        (Code : 'mi'; Name : 'Māori'),
        (Code : 'mr'; Name : 'Marathi (Marāṭhī)'),
        (Code : 'mh'; Name : 'Marshallese'),
        (Code : 'mn'; Name : 'Mongolian'),
        (Code : 'na'; Name : 'Nauru'),
        (Code : 'nv'; Name : 'Navajo, Navaho'),
        (Code : 'nb'; Name : 'Norwegian Bokmål'),
        (Code : 'nd'; Name : 'North Ndebele'),
        (Code : 'ne'; Name : 'Nepali'),
        (Code : 'ng'; Name : 'Ndonga'),
        (Code : 'nn'; Name : 'Norwegian Nynorsk'),
        (Code : 'no'; Name : 'Norwegian'),
        (Code : 'ii'; Name : 'Nuosu'),
        (Code : 'nr'; Name : 'South Ndebele'),
        (Code : 'oc'; Name : 'Occitan'),
        (Code : 'oj'; Name : 'Ojibwe, Ojibwa'),
        (Code : 'cu'; Name : 'Old Church Slavonic'),
        (Code : 'om'; Name : 'Oromo'),
        (Code : 'or'; Name : 'Oriya'),
        (Code : 'os'; Name : 'Ossetian, Ossetic'),
        (Code : 'pa'; Name : 'Panjabi, Punjabi'),
        (Code : 'pi'; Name : 'Pāli'),
        (Code : 'fa'; Name : 'Persian'),
        (Code : 'pl'; Name : 'Polish'),
        (Code : 'ps'; Name : 'Pashto, Pushto'),
        (Code : 'pt'; Name : 'Portuguese'),
        (Code : 'qu'; Name : 'Quechua'),
        (Code : 'rm'; Name : 'Romansh'),
        (Code : 'rn'; Name : 'Kirundi'),
        (Code : 'ro'; Name : 'Romanian, Moldavan'),
        (Code : 'ru'; Name : 'Russian'),
        (Code : 'sa'; Name : 'Sanskrit (Saṁskṛta)'),
        (Code : 'sc'; Name : 'Sardinian'),
        (Code : 'sd'; Name : 'Sindhi'),
        (Code : 'se'; Name : 'Northern Sami'),
        (Code : 'sm'; Name : 'Samoan'),
        (Code : 'sg'; Name : 'Sango'),
        (Code : 'sr'; Name : 'Serbian'),
        (Code : 'gd'; Name : 'Scottish Gaelic'),
        (Code : 'sn'; Name : 'Shona'),
        (Code : 'si'; Name : 'Sinhala, Sinhalese'),
        (Code : 'sk'; Name : 'Slovak'),
        (Code : 'sl'; Name : 'Slovene'),
        (Code : 'so'; Name : 'Somali'),
        (Code : 'st'; Name : 'Southern Sotho'),
        (Code : 'es'; Name : 'Spanish; Castilian'),
        (Code : 'su'; Name : 'Sundanese'),
        (Code : 'sw'; Name : 'Swahili'),
        (Code : 'ss'; Name : 'Swati'),
        (Code : 'sv'; Name : 'Swedish'),
        (Code : 'ta'; Name : 'Tamil'),
        (Code : 'te'; Name : 'Telugu'),
        (Code : 'tg'; Name : 'Tajik'),
        (Code : 'th'; Name : 'Thai'),
        (Code : 'ti'; Name : 'Tigrinya'),
        (Code : 'bo'; Name : 'Tibetan'),
        (Code : 'tk'; Name : 'Turkmen'),
        (Code : 'tl'; Name : 'Tagalog'),
        (Code : 'tn'; Name : 'Tswana'),
        (Code : 'to'; Name : 'Tonga'),
        (Code : 'tr'; Name : 'Turkish'),
        (Code : 'ts'; Name : 'Tsonga'),
        (Code : 'tt'; Name : 'Tatar'),
        (Code : 'tw'; Name : 'Twi'),
        (Code : 'ty'; Name : 'Tahitian'),
        (Code : 'ug'; Name : 'Uighur, Uyghur'),
        (Code : 'uk'; Name : 'Ukrainian'),
        (Code : 'ur'; Name : 'Urdu'),
        (Code : 'uz'; Name : 'Uzbek'),
        (Code : 've'; Name : 'Venda'),
        (Code : 'vi'; Name : 'Vietnamese'),
        (Code : 'vo'; Name : 'Volapük'),
        (Code : 'wa'; Name : 'Walloon'),
        (Code : 'cy'; Name : 'Welsh'),
        (Code : 'wo'; Name : 'Wolof'),
        (Code : 'fy'; Name : 'Western Frisian'),
        (Code : 'xh'; Name : 'Xhosa'),
        (Code : 'yi'; Name : 'Yiddish'),
        (Code : 'yo'; Name : 'Yoruba'),
        (Code : 'za'; Name : 'Zhuang, Chuang'),
        (Code : 'zu'; Name : 'Zulu')
      );

    private
      fISO639_1_Dictionary : TDictionary<string, string>;
    public
      constructor Create;
      function ISO639_1ToLangName(const Code : string): string;
      function LangName2ISO639_1(const Name : string): string;
  end;

implementation

{ TFastISO639_1_Locator }

constructor TFastISO639_1_Locator.Create;
begin
  fISO639_1_Dictionary := TDictionary<string, string>.Create;
  for var isoType in ISO639_1_TYPES do
  begin
    fISO639_1_Dictionary.Add(isoType.Code, isoType.Name);
    fISO639_1_Dictionary.Add(isoType.Name, isoType.Code);
  end;
end;

function TFastISO639_1_Locator.ISO639_1ToLangName(const Code : string): string;
begin
  fISO639_1_Dictionary.TryGetValue(Code, Result);
  if Result = string.Empty then raise TISO639_1_CodeNotFoundException.Create('Unrecognized code : ' + Code);
end;

function TFastISO639_1_Locator.LangName2ISO639_1(const Name : string): string;
begin
  fISO639_1_Dictionary.TryGetValue(Name, Result);
  if Result = string.Empty then raise TISO639_1_NameNotFoundException.Create('Unrecognized name : ' + Name);
end;

end.
