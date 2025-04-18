import '../api/UserAPIService.dart';
import '../model/User.dart';
import '../view/UserForm.dart';
import 'package:flutter/material.dart';

class EditUserScreen extends StatelessWidget {
  final User user;

  const EditUserScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserForm(
      user: user,
      onSave: (User updatedUser) async {
        try {
          // Sửa dòng này: đảm bảo updatedUser là tham số đúng
          await UserAPIService.instance.updateUser(updatedUser);
          Navigator.pop(context, true);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Cập nhật người dùng thành công'),
              backgroundColor: Colors.green,
            ),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Lỗi khi cập nhật người dùng: $e'),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.pop(context, false);
        }
      },
    );
  }
}