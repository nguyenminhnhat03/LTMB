import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

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
          ElevatedButton(onPressed: (){print("ElevetecdButton");},
              child: Text("ElevetedButton", style: TextStyle(fontSize: 24),)
          ),
          SizedBox(height: 20,),
          TextButton(
              onPressed: (){print("TextButton");},
              child: Text("TextButton", style: TextStyle(fontSize: 24),)
          ),


          SizedBox(height: 20,),
          OutlinedButton(
              onPressed: (){print("OutlineButton");},
              child: Text("OutlineButton", style: TextStyle(fontSize: 24),)
          ),

          SizedBox(height: 20,),
          IconButton(onPressed: (){print("IconButton");},
              icon: Icon(Icons.favorite),),

          SizedBox(height: 20,),
          FloatingActionButton(onPressed: (){print("FloatingActionButton");},
            child: Icon(Icons.access_alarm_sharp),
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