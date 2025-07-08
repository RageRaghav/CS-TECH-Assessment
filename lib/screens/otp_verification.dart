import 'package:cs_tech_assessment/screens/signin.dart';
import 'package:cs_tech_assessment/services/auth_services.dart';
import 'package:cs_tech_assessment/utils/utils.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  static const String routeName = '/opt_screen';
  final String email;

  const OTPScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController otpController = TextEditingController();

  
  Future<void> sendOtp(String email) async {
    final response2 = await AuthServices.send_otp(
      context: context,
      email: email,
    );

    if (response2 != null && response2['message'] == "OTP sent") {
      ShowSnackBar(context, 'OTP sent!');
    }
  }


  Future<void> verifyOtp(String email, String otp) async {
    final response = await AuthServices.verify_otp(
      context: context,
      email: email,
      otp: otp,
    );

    if (response != null && response['message'] == "OTP Verfied") {
      Navigator.pushNamed(context, SigninScreen.routeName);
    }
  }

  @override
  void initState() {
    super.initState();
    sendOtp(widget.email); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Whatsapp OTP Verification',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Please enter the verification code sent to your mobile number via WhatsApp.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 6,
                decoration: const InputDecoration(
                  hintText: 'Enter OTP',
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
              ),
              const SizedBox(height: 20),
              const Text('+91 7896256877'),
              const SizedBox(height: 10),
  
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't receive OTP? "),
                  GestureDetector(
                    onTap: () => sendOtp(widget.email),
                    child: const Text(
                      "Resend OTP",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),

              const Spacer(),

          
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    verifyOtp(widget.email, otpController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Verify',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
