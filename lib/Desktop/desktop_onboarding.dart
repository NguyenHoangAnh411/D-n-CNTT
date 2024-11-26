import 'package:flutter/material.dart';
import 'package:my_project/reuseable_items.dart';

class DesktopOnboarding extends StatelessWidget {
  const DesktopOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        centerTitle: false,
        title: const Text(
          "Label",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFFFFFFF),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Color(0XFFdfeff3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Tạo một tài khoản để bắt đầu',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.40,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                'Tiếp tục bằng số điện thoại',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              style: customElevatedButtonStyle,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: Divider(color: Colors.grey))
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.40,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: customEmailButtonStyle,
                              child: const Center(
                                child: Text(
                                  'Tiếp tục với email',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.40,
                            height: 40,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.grey),
                              ),
                              child: const Text(
                                'Tiếp tục với Google',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.40,
                            height: 40,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.grey),
                              ),
                              child: const Text(
                                'Tiếp tục với Facebook',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Bạn đã có tài khoản?',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFd9d9d9)),
                                ),
                                const SizedBox(width: 0),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Đăng nhập',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1c49ff)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
