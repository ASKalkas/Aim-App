import 'package:flutter/material.dart';
import '../pageComponents/profileInfo.dart';

class ProfilePage extends StatelessWidget{
  const ProfilePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: ProfileInfo(),),
    );
  }
}