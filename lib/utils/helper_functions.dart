import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DateFormatConstant {
  static final formatMMMd = "MMM d";
  static final formatYYYYMMDD = "yyyy-MM-dd";
}

extension DateString on DateTime {
  String dateString() {
    return stringDateWithFormat(this, DateFormatConstant.formatYYYYMMDD);
  }
}

String dateFromEpochFormatMMMd(
    int epochSecs,
    ) {
  return stringDateWithFormat(
      DateTime.fromMillisecondsSinceEpoch((epochSecs) * 1000),
      DateFormatConstant.formatMMMd);
}
int dateToEpoch(
    DateTime date,
    ) {
  return date.millisecondsSinceEpoch;
}

//Return string date with input date format
String stringDateWithFormat(DateTime date, String format) {
  if (date != null) {
    final DateFormat formatter = DateFormat(format);
    return formatter.format(date);
  }
  return "";
}
void launchURL(String urlToLaunch) async =>
    await canLaunch(urlToLaunch) ? await launch(urlToLaunch) : throw 'Could not launch $urlToLaunch';