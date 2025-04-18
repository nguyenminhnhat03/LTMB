import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({super.key});

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
          const SizedBox(height: 50,),
          const Text("Nguyễn Minh Nhật"),
          const SizedBox(height: 20,),

          const Text (
            "Xin chào các bạn đến với lập trình Flutter",
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color:  Colors.blue,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 20,),
          const Text (
            "Flutter là một SDK phát triển ứng dụng di động nguồn mở được tạo ra bởi Google, nó được sử dụng rất rộng rãi trên thế giới ",
            textAlign: TextAlign.center,
            maxLines: 2, //so dong toi da
            style:  TextStyle(
              fontSize: 30,
              color:  Colors.black,
              letterSpacing: 1.5,
            ),
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