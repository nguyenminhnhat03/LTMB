import 'dart:async';

// void VDStreamDemSo() {
//   print("==== Ví dụ 1: Stream trò chơi năm mười =====");
//   Stream<int> stream = Stream<int>.periodic(
//     Duration(seconds: 2),
//     (x) => x,
//   ).take(20);

//   // lắng nghe
//   stream.listen(
//     (data) {
//       print("Số: ${data * 5} - đang chạy trốn!");
//     },
//     onDone: () => print("Người bị: bắt đầu đi tìm"),
//     onError: (err) => print("Lỗi: $err -- Ngưng cuộc chơi"),
//   );
// }

void VDStreamController() {
  print("==== Ví dụ 2: StreamController =====");
  StreamController<String> controller = StreamController<String>();

  controller.stream.listen(
    (data) => print("Tin nhắn mới: $data"),
    onDone: () => print("Khồng còn tin nhắn nữa"),
  );

  print("Đang gửi tin nhắn đầu tiên.....");
  controller.add("Xin chào!");

  Future.delayed(Duration(seconds: 2), () {
    print("Đang gửi tin nhắn thứ hai...");
    controller.add("Bạn khỏe không?");
  });

  Future.delayed(Duration(seconds: 4), () {
    print("Đang gửi tin nhắn cuối...");
    controller.add("Tạm biệt!");
    controller.close();
  });
}

void main() {
  // VDStreamDemSo();
  VDStreamController();
}
