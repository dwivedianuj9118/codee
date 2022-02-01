import 'package:flutter/material.dart';
import 'package:login/ApiService.dart';

final phoneText = TextEditingController();
void main() {
  runApp(HomeDesign());
}
class HomeDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   return new MaterialApp(
   title: 'Flutter Demo',
   home: new MyApp(),
     routes: {
       '/login':(context)=>LoginPage(),
       '/register':(context)=>RegPage(),
       '/otp':(context)=>OtpPage()
     },
    );
  }
}

class OtpApp extends StatelessWidget{
  const OtpApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OtpPage();
  }

}
class RegApp extends StatelessWidget{
  const RegApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RegPage();
  }

}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: [
        ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, '/register');
        }, child: Text('Register')),
        ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, '/otp');
        }, child: Text('OTP')),
      ],
    ),);
  }

}
class OtpPage extends StatefulWidget{
  const OtpPage({Key? key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage>{
  final otpText = TextEditingController();
  //verifyotp
  callOtpApi() {
    final service = ApiServices();

     service.apiVerifyOtp(
        {
          "Mobile": phoneText.text,
           "OTP":otpText.text,
        },
      ).then((value){
          if(value.msg != null){
            print("get data >>>>>> " + value.msg!);
          }else{
            print(value.status!);
            print(value.data!);
            //push
          }
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Column(
        children: [
          TextFormField(initialValue: phoneText.text, readOnly: true),
          TextField(
            //obscureText: true,
              controller: otpText,
              decoration: InputDecoration(
                labelText: 'OTP',
                hintText: 'Enter Your Otp',
              )
          ),
          TextButton(
            onPressed: () async{
            await callOtpApi();
            Navigator.pushNamed(context, '/login');
            },
            child: Text(
              'Submit',
            ),
          ),
        ],
      ),
    );
  }

}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 final passwordText = TextEditingController();
 final phoneText = TextEditingController();

 //login
  callLoginApi() {
    final service = ApiServices();

    service.apiLogin(
      {
        "Password": passwordText.text,
        "Username": phoneText.text
      },
    ).then((value){
      if(value.msg != null){
        print("get data >>>>>> " + value.msg!);
      }else{
        print(value.status!);
        print(value.data!);
        //push
      }
    });

  }


  @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Login'),
     ),
     body: Column(
       children: [
         TextField(
           controller: phoneText,
           decoration: InputDecoration(
             border: InputBorder.none,
             labelText: 'Mobile',
             hintText: 'Enter Your Register No',
           ),
         ),
         TextField(
           //obscureText: true,
           controller: passwordText,
           decoration: InputDecoration(
             labelText: 'Password',
             hintText: 'Enter Your password',
           ),
         ),
         TextButton(
           onPressed: () {
             callLoginApi();
           },
           child: Text(
             'Submit',
           ),
         ),
       ],
     ),
   );
 }
}

class RegPage extends StatefulWidget{
  const RegPage({Key? key}) : super(key: key);
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage>{

  final emailText = TextEditingController();
  final passwordText = TextEditingController();
  final nameText = TextEditingController();
  final genderText = TextEditingController();
  final addressText = TextEditingController();
  final otpText = TextEditingController();

  //Reg Api
  callRegApi() {
    final service = ApiServices();

    service.apiReg(
      {
        "CustomerName": nameText.text,
        "CustomerPassword": passwordText.text,
        "CustomerPhone": phoneText.text,
        "CustomerEmail": emailText.text,
        "CustomerGender": genderText.text,
        "CustomerAddress": addressText.text,
      },
    ).then((value){
      if(value.msg != null){
        print("get data >>>>>> " + value.msg!);

      }else{
        print(value.status!);
        print(value.data!);
        //push
      }

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameText,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Name',
              hintText: 'Enter Your Name',
            ),
          ),
          TextField(
            controller: emailText,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Email',
              hintText: 'Enter Your Email',
            ),
          ),
          TextField(
            controller: phoneText,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Mobile No',
              hintText: 'Enter Your Mobile No',
            ),
          ),
          TextField(
            controller: genderText,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Gender',
              hintText: 'Enter Your gender',
            ),
          ),
          TextField(
            //obscureText: true,
            controller: addressText,
            decoration: InputDecoration(
              labelText: 'Address',
              hintText: 'Enter Your address',
            ),
          ),
          TextField(
            //obscureText: true,
            controller: passwordText,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter Your password',
            ),
          ),
          TextButton(
            onPressed: () async{
              await callRegApi();
              Navigator.pushNamed(context, '/otp');
            },
            child: Text(
              'Submit',
            ),
          ),
        ],
      ),
    );
  }



}


