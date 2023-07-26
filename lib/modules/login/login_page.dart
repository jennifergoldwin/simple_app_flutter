import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_app_flutter/modules/login/login_controller.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller)=> Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                      child: Text("LOGIN",
                        style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                        child: TextFormField(
                          controller: controller.usernameController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), labelText: "Username"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            if (!controller.checkPalindrome(value)){
                              return 'Username must be palindrome' ;
                            }
                            return null;
                          },
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                        child: TextFormField(
                          controller: controller.passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), labelText: "Password"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        )
                    ),
                    Padding(padding: const EdgeInsets.symmetric( vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8.0)),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                        child: GestureDetector(
                          onTap: () => controller.submitLogin(),
                          child: const Text('Login',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16),),
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8.0)),
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                        child: GestureDetector(
                          onTap: () => {
                            if(controller.checkAnagram()){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Username & Password is anagram!'),))
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Username & Password is not anagram!'),))
                            }
                          },
                          child: const Text('Check anagram',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }


}
