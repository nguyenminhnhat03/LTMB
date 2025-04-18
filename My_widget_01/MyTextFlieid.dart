import 'package:flutter/material.dart';

class MyTextFlieid extends StatelessWidget {
  const MyTextFlieid({super.key});

  @override
  Widget build(BuildContext context) {
    // Trả về Scaffold - widget cung cấp bố cục Material Design cơ bản
    // Màn hình
    return Scaffold(
      // Tiêu đề của ứng dụng
      appBar: AppBar(
        //Tiêu đề
        title: Text("App 02"),
        //màu nền
        backgroundColor: Colors.deepOrangeAccent,
        // Độ nắng/ đổ bóng của Appbar
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              print("b1");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("b2");
            },
            icon: Icon(Icons.abc),
          ),
          IconButton(
            onPressed: () {
              print("b3");
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),

      //backgroundColor: Colors.cyanAccent,
      body: Center(child: Column(
        children: [
          SizedBox(height: 50,),
           TextField(
             decoration: InputDecoration(
               labelText: "Email",
               hintText: 'example@gmail.com',
               helperText: "Nhập vào email cá nhân",
               prefixIcon: Icon(Icons.email),
               suffixIcon: Icon(Icons.clear),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(100)
               ),
               filled: true,
               fillColor: Colors.greenAccent,
             ),
           ),

           SizedBox(height: 50,),

            TextField(
              decoration: InputDecoration(
                labelText: "Số điện thoại",
                hintText: "Nhập vào số điện thoại",
                border: OutlineInputBorder(),
              ),
            ),

          SizedBox(height: 50,),

          TextField(
            decoration: InputDecoration(
              labelText: "Ngày Sinh",
              hintText: "Nhập vào ngày sinh của bạn",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.datetime,
          ),

          SizedBox(height: 50,),

          TextField(
            decoration: InputDecoration(
              labelText: "Mật Khẩu",
              hintText: "Nhập vào Mật khẩu của bạn",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.datetime,
            obscureText: true,
            obscuringCharacter: '*',
          ),

          SizedBox(height: 50,),

          TextField(
            onChanged: (value){
              print("Dang nhập: $value");
            },
            onSubmitted: (value){
              print("Đã hoàn thành nội dung : $value");
            },
            decoration: InputDecoration(
              labelText: "Câu hỏi bí mật",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.datetime,


          )
        ],
      )),



      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("pressed");
        },
        child: const Icon(Icons.add_ic_call),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Tìm kiếm"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Cá nhân"),
        ],
      ),
    );
  }
}