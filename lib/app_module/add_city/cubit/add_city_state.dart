class AddCityState {
  String? cityName;
  String? cityCode;
  String? cityLanguage;
  String? cityLong;
  String? cityLat;
  bool isReady;

  
  AddCityState({
    this.cityName,
    this.cityCode,
    this.cityLanguage,
    this.cityLong,
    this.cityLat,
    required this.isReady,
  });




  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AddCityState &&
      other.cityName == cityName &&
      other.cityCode == cityCode &&
      other.cityLanguage == cityLanguage &&
      other.cityLong == cityLong &&
      other.cityLat == cityLat &&
      other.isReady == isReady;
  }

  @override
  int get hashCode {
    return cityName.hashCode ^
      cityCode.hashCode ^
      cityLanguage.hashCode ^
      cityLong.hashCode ^
      cityLat.hashCode ^
      isReady.hashCode;
  }

  AddCityState copyWith({
    String? cityName,
    String? cityCode,
    String? cityLanguage,
    String? cityLong,
    String? cityLat,
    bool? isReady,
  }) {
    return AddCityState(
      cityName: cityName ?? this.cityName,
      cityCode: cityCode ?? this.cityCode,
      cityLanguage: cityLanguage ?? this.cityLanguage,
      cityLong: cityLong ?? this.cityLong,
      cityLat: cityLat ?? this.cityLat,
      isReady: isReady ?? this.isReady,
    );
  }
}
