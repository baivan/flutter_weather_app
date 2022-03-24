import 'package:intl/intl.dart';

class ServerRequestError {
  final String message;
  ServerRequestError({required this.message});
}

class DataConversionError {
  final String message;
  DataConversionError({required this.message});
}

class DataDisplayError {
  final String message;
  DataDisplayError({required this.message});
}

String dateToHumanFormat(String date) {
  DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm").parse(date);
  return DateFormat.yMMMEd().format(parseDate);
}

String apiweatherkey = "<Your api weather key ">";
