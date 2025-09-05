// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import '../models/quote_model.dart';

// class NotificationService {
//   static final _notifications = FlutterLocalNotificationsPlugin();

//   static Future<void> init() async {
//     const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const iOSSettings = DarwinInitializationSettings();
//     const initSettings = InitializationSettings(
//       android: androidSettings,
//       iOS: iOSSettings,
//     );

//     await _notifications.initialize(initSettings);
//   }

//   static Future<void> showDailyQuoteNotification(Quote quote) async {
//     const androidDetails = AndroidNotificationDetails(
//       'daily_quote_channel',
//       'Daily Quote',
//       channelDescription: 'Recevez une citation quotidienne',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     const iosDetails = DarwinNotificationDetails();
//     const notificationDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);

//     // Planifier notification pour aujourd'hui 9h
//     final now = DateTime.now();
//     final scheduledTime = DateTime(now.year, now.month, now.day, 9, 0, 0);

//     await _notifications.zonedSchedule(
//       quote.id,
//       'Citation du jour',
//       quote.text,
//       scheduledTime,
//       notificationDetails,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time, androidScheduleMode: null, // répète tous les jours à la même heure
//     );
//   }
// }
// //
