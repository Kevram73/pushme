import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SmsController extends GetxController {
  RxBool isLoading = false.obs;

  // Demande les permissions nécessaires pour l'envoi de SMS
  Future<void> requestPermissions() async {
    var status = await Permission.sms.status;
    if (!status.isGranted) {
      await Permission.sms.request();
    }
  }

  // Génère un code aléatoire entre 1000 et 9999
  String generateCode() {
    return (1000 + (9000 * (DateTime.now().millisecondsSinceEpoch % 1000) / 1000).round()).toString();
  }

  // Envoie un SMS avec un code
  Future<void> sendSms(String message, List<String> recipients) async {
    isLoading(true); // Active le loader
    try {
      String result = await sendSMS(
        message: message,
        recipients: recipients,
        sendDirect: false,
      );
      Get.snackbar("Succès", "SMS envoyé : $result",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Erreur", "Échec de l'envoi du SMS : $e",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    } finally {
      isLoading(false); // Désactive le loader
    }
  }
}
