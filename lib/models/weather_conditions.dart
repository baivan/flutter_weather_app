class WeatherConditions {
  final int code;
  final String description;
  final String icon;

  WeatherConditions(this.code, this.description, this.icon);

  factory WeatherConditions.fromJson(Map<String, dynamic> json) {
    return WeatherConditions(json['code'], json['text'],
        json['icon'].substring(json['icon'].lastIndexOf("/") + 1));
  }
}
