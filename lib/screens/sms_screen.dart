import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sms_controller.dart';

class SmsScreen extends StatelessWidget {
  final SmsController smsController = Get.put(SmsController());

  SmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Envoi de Code SMS"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await smsController.requestPermissions(); // Demander les permissions
                String code = smsController.generateCode(); // Générer un code
                String message = "4F50454E";

                // Numéro de destinataire (vous pouvez le rendre dynamique)
                List<String> recipients = ["91367306"];

                // Envoyer le SMS
                await smsController.sendSms(message, recipients);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
              child: const Text("Envoyer le Code"),
            ),
            const SizedBox(height: 20),
            Obx(() => smsController.isLoading.value
                ? const CircularProgressIndicator()
                : const SizedBox()),
          ],
        ),
      ),
    );
  }
}
