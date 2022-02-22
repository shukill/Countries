import 'dart:convert';

List<Countries> countryFromJson(String str) => List<Countries>.from(
      json.decode(str).map(
            (x) => Countries.fromJson(x),
          ),
    );

class Countries {
  Name? name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;
  bool? independent;
  String? status;
  bool? unMember;
  Currencies? currencies;
  List<String>? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  Map<String, dynamic>? languages;
  Translations? translations;
  List<double>? latlng;
  bool? landlocked;
  List<String>? borders;
  double? area;
  Demonyms? demonyms;
  String? flag;
  Maps? maps;
  int? population;
  Gini? gini;
  String? fifa;
  Car? car;
  List<String>? timezones;
  List<String>? continents;
  Flags? flags;
  Flags? coatOfArms;
  String? startOfWeek;
  CapitalInfo? capitalInfo;
  PostalCode? postalCode;

  Countries({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.borders,
    required this.area,
    required this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    required this.gini,
    required this.fifa,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    required this.postalCode,
  });

  Countries.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    tld = json['tld'] != null ? json['tld'].cast<String>() : [];
    cca2 = json['cca2'];
    ccn3 = json['ccn3'];
    cca3 = json['cca3'];
    cioc = json['cioc'];
    independent = json['independent'];
    status = json['status'];
    unMember = json['unMember'];
    currencies = json['currencies'] != null
        ? Currencies.fromJson(json['currencies'])
        : null;
    capital = json['capital'] != null ? json['capital'].cast<String>() : [];
    altSpellings =
        json['altSpellings'] != null ? json['altSpellings'].cast<String>() : [];
    region = json['region'];
    subregion = json['subregion'];
    languages = json['languages'];
    translations = json['translations'] != null
        ? Translations.fromJson(json['translations'])
        : null;
    latlng = json['latlng'] != null ? json['latlng'].cast<double>() : [];
    landlocked = json['landlocked'];
    borders = json['borders'] != null ? json['borders'].cast<String>() : [];
    area = json['area'];
    demonyms =
        json['demonyms'] != null ? Demonyms.fromJson(json['demonyms']) : null;
    flag = json['flag'];
    maps = json['maps'] != null ? Maps.fromJson(json['maps']) : null;
    population = json['population'];
    gini = json['gini'] != null ? Gini.fromJson(json['gini']) : null;
    fifa = json['fifa'];
    car = json['car'] != null ? Car.fromJson(json['car']) : null;
    timezones =
        json['timezones'] != null ? json['timezones'].cast<String>() : [];
    continents =
        json['continents'] != null ? json['continents'].cast<String>() : [];
    flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    coatOfArms =
        json['coatOfArms'] != null ? Flags.fromJson(json['coatOfArms']) : null;
    startOfWeek = json['startOfWeek'];
    capitalInfo = json['capitalInfo'] != null
        ? CapitalInfo.fromJson(json['capitalInfo'])
        : null;
    postalCode = json['postalCode'] != null
        ? PostalCode.fromJson(json['postalCode'])
        : null;
  }
}

class Name {
  String? common;
  String? official;
  NativeName? nativeName;

  Name({this.common, this.official, this.nativeName});

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
    nativeName = json['nativeName'] != null
        ? NativeName.fromJson(json['nativeName'])
        : null;
  }
}

class NativeName {
  Cnr? cnr;

  NativeName({this.cnr});

  NativeName.fromJson(Map<String, dynamic> json) {
    cnr = json['cnr'] != null ? Cnr.fromJson(json['cnr']) : null;
  }
}

class Cnr {
  String? official;
  String? common;

  Cnr({this.official, this.common});

  Cnr.fromJson(Map<String, dynamic> json) {
    official = json['official'];
    common = json['common'];
  }
}

class Currencies {
  EUR? eUR;

  Currencies({this.eUR});

  Currencies.fromJson(Map<String, dynamic> json) {
    eUR = json['EUR'] != null ? EUR.fromJson(json['EUR']) : null;
  }
}

class EUR {
  String? name;
  String? symbol;

  EUR({this.name, this.symbol});

  EUR.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
  }
}

class Languages {
  String? cnr;

  Languages({this.cnr});

  Languages.fromJson(Map<String, dynamic> json) {
    cnr = json['cnr'];
  }
}

class Translations {
  Cnr? ara;
  Cnr? ces;
  Cnr? cym;
  Cnr? deu;
  Cnr? est;
  Cnr? fin;
  Eng? fra;
  Cnr? hrv;
  Cnr? hun;
  Cnr? ita;
  Cnr? jpn;
  Cnr? kor;
  Cnr? nld;
  Cnr? per;
  Cnr? pol;
  Cnr? por;
  Cnr? rus;
  Cnr? slk;
  Cnr? spa;
  Cnr? swe;
  Cnr? urd;
  Cnr? zho;

  Translations(
      {this.ara,
      this.ces,
      this.cym,
      this.deu,
      this.est,
      this.fin,
      this.fra,
      this.hrv,
      this.hun,
      this.ita,
      this.jpn,
      this.kor,
      this.nld,
      this.per,
      this.pol,
      this.por,
      this.rus,
      this.slk,
      this.spa,
      this.swe,
      this.urd,
      this.zho});

  Translations.fromJson(Map<String, dynamic> json) {
    ara = json['ara'] != null ? Cnr.fromJson(json['ara']) : null;
    ces = json['ces'] != null ? Cnr.fromJson(json['ces']) : null;
    cym = json['cym'] != null ? Cnr.fromJson(json['cym']) : null;
    deu = json['deu'] != null ? Cnr.fromJson(json['deu']) : null;
    est = json['est'] != null ? Cnr.fromJson(json['est']) : null;
    fin = json['fin'] != null ? Cnr.fromJson(json['fin']) : null;
    fra = json['fra'] != null ? Eng.fromJson(json['fra']) : null;
    hrv = json['hrv'] != null ? Cnr.fromJson(json['hrv']) : null;
    hun = json['hun'] != null ? Cnr.fromJson(json['hun']) : null;
    ita = json['ita'] != null ? Cnr.fromJson(json['ita']) : null;
    jpn = json['jpn'] != null ? Cnr.fromJson(json['jpn']) : null;
    kor = json['kor'] != null ? Cnr.fromJson(json['kor']) : null;
    nld = json['nld'] != null ? Cnr.fromJson(json['nld']) : null;
    per = json['per'] != null ? Cnr.fromJson(json['per']) : null;
    pol = json['pol'] != null ? Cnr.fromJson(json['pol']) : null;
    por = json['por'] != null ? Cnr.fromJson(json['por']) : null;
    rus = json['rus'] != null ? Cnr.fromJson(json['rus']) : null;
    slk = json['slk'] != null ? Cnr.fromJson(json['slk']) : null;
    spa = json['spa'] != null ? Cnr.fromJson(json['spa']) : null;
    swe = json['swe'] != null ? Cnr.fromJson(json['swe']) : null;
    urd = json['urd'] != null ? Cnr.fromJson(json['urd']) : null;
    zho = json['zho'] != null ? Cnr.fromJson(json['zho']) : null;
  }
}

class Demonyms {
  Eng? eng;
  Eng? fra;

  Demonyms({this.eng, this.fra});

  Demonyms.fromJson(Map<String, dynamic> json) {
    eng = json['eng'] != null ? Eng.fromJson(json['eng']) : null;
    fra = json['fra'] != null ? Eng.fromJson(json['fra']) : null;
  }
}

class Eng {
  String? f;
  String? m;

  Eng({this.f, this.m});

  Eng.fromJson(Map<String, dynamic> json) {
    f = json['f'];
    m = json['m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['f'] = f;
    data['m'] = m;
    return data;
  }
}

class Maps {
  String? googleMaps;
  String? openStreetMaps;

  Maps({this.googleMaps, this.openStreetMaps});

  Maps.fromJson(Map<String, dynamic> json) {
    googleMaps = json['googleMaps'];
    openStreetMaps = json['openStreetMaps'];
  }
}

class Gini {
  double? d2016;

  Gini({this.d2016});

  Gini.fromJson(Map<String, dynamic> json) {
    d2016 = json['2016'];
  }
}

class Car {
  List<String>? signs;
  String? side;

  Car({this.signs, this.side});

  Car.fromJson(Map<String, dynamic> json) {
    signs = json['signs'] != null ? json['signs'].cast<String>() : [];
    side = json['side'];
  }
}

class Flags {
  String? png;
  String? svg;

  Flags({this.png, this.svg});

  Flags.fromJson(Map<String, dynamic> json) {
    png = json['png'];
    svg = json['svg'];
  }
}

class CapitalInfo {
  List<double>? latlng;

  CapitalInfo({this.latlng});

  CapitalInfo.fromJson(Map<String, dynamic> json) {
    latlng = json['latlng'] != null ? json['latlng'].cast<double>() : [];
  }
}

class PostalCode {
  String? format;
  String? regex;

  PostalCode({this.format, this.regex});

  PostalCode.fromJson(Map<String, dynamic> json) {
    format = json['format'];
    regex = json['regex'];
  }
}
