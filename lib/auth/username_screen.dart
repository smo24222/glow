import 'package:flutter/material.dart';

import '../contants/gaps.dart';
import '../contants/sizes.dart';
import 'auth_button.dart';
import 'email_screen.dart';

class UserNameScreen extends StatefulWidget {
  const UserNameScreen({super.key});

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  final TextEditingController _usernameController = TextEditingController();

  String _username = "";

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    //Statefull widget은 BuildContext context 필요X
    if (_username.isEmpty) return;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const EmailScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: const Text('회원가입'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                '사용자 이름',
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.w700),
              ),
              Gaps.v8,
              const Text(
                ' 사용자 이름은 나중에 변경할 수 있습니다',
                style: TextStyle(fontSize: Sizes.size16, color: Colors.black54),
              ),
              Gaps.v16,
              TextField(
                controller: _usernameController,
                cursorColor: Theme.of(context).primaryColor,
                decoration: const InputDecoration(
                  hintText: "Username",
                ),
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onNextTap,
                child: AuthButton(disable: _username.isEmpty),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
