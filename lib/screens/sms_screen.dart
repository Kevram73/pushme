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
        title: const Text("Ouverture du garage"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             ElevatedButton(
  onPressed: () async {
    await smsController.requestPermissions();
    String code = smsController.generateCode();
    String message = "4F50454E";

    List<String> recipients = ["91367306"];
    await smsController.sendSms(message, recipients);
  },
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(50),
    shape: const CircleBorder(),
    backgroundColor: Colors.blue,
    shadowColor: Colors.black, // Couleur de l'ombre
    elevation: 10, // Élévation pour effet 3D
    surfaceTintColor: Colors.blueAccent, // Accentuation lors de l'effet de pression
  ),
  child: const Text(
    "OPEN",
    style: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
)
,
              const SizedBox(height: 20),
              Obx(() => smsController.isLoading.value
                  ? const CircularProgressIndicator()
                  : const SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
