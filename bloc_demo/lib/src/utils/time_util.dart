import 'package:date_format/date_format.dart';
class TimeUtil {
  static String timeToString(int time) {
    String createTimeString = time.toString();
    if (createTimeString.length < 13) {
     createTimeString = time.toString() + "000";
    }
    DateTime createTime = DateTime.fromMillisecondsSinceEpoch(int.parse(createTimeString));
    
    var now = new DateTime.now();
    Duration diffTime = now.difference(createTime);
    
    int hours = diffTime.inHours;
    int minutes = diffTime.inMinutes;

    if (hours > 48) {
      return formatDate(createTime, [yyyy, '.', mm, '.', dd, ' ', HH, ':', nn, ':', ss]);
    } else if ( hours> 24){
      return "昨天${createTime.hour}:${createTime.minute}";
    } else if ( hours> 1){
      return "今天${createTime.hour}:${createTime.minute}";
    } else if ( minutes>1 ){
      return "${ minutes.toString() }分钟前";
    } else {
      int seconds = diffTime.inSeconds;
      return "${ seconds.toString() }秒前";
    }
  }
}