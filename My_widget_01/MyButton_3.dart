import 'package:flutter/material.dart';

class MyButton_3 extends StatelessWidget {
  const MyButton_3({super.key});

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


          ElevatedButton(onPressed: null,
              child: Text("ElevetedButton", style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20, //Chiều ngang
                    vertical: 15, // Chiều dọc
                ),
                elevation: 15,

              ),
          ),
          ElevatedButton(onPressed: (){print("Pressed");},
            onLongPress: (){print("LongPresssed");},
            child: Text("ElevetedButton", style: TextStyle(fontSize: 24)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(
                horizontal: 20, //Chiều ngang
                vertical: 15, // Chiều dọc
              ),
              elevation: 15,

            ),
          ),



          SizedBox(height: 20,),
          IconButton(onPressed: (){print("IconButton");},
              icon: Icon(Icons.favorite),
              style: IconButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,

                )
              ),
          ),
          InkWell(
            onTap: (){
              print("InkWell được nhấn");
            },
            onDoubleTap: (){print("InkWell được nhấn 2 lần liên tiếp");},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
              child: Text("Button tùy chỉnh với InkWell"),
            ),
          ),

          SizedBox(height: 50,),
          IconButton(onPressed: (){print("Yêu Thích");},
            icon: Icon(Icons.favorite),
            style: IconButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,

                )
            ),
          ),
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