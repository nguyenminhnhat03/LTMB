class Note { // Định nghĩa lớp Note để đại diện cho một ghi chú
   int? id; // ID duy nhất của ghi chú, có thể null nếu chưa lưu vào DB
   String title; // Tiêu đề của ghi chú
   String content; // Nội dung chi tiết của ghi chú
   int priority; // Mức độ ưu tiên (1: Thấp, 2: Trung bình, 3: Cao)
   DateTime createdAt; // Thời gian tạo ghi chú
   DateTime modifiedAt; // Thời gian cập nhật gần nhất
   List<String>? tags; // Danh sách các nhãn (tags), có thể null
   String? color; // Mã màu của ghi chú, có thể null

  Note({ // Constructor chính của lớp Note
    this.id, // Tham số id là tùy chọn
    required this.title, // Tiêu đề là bắt buộc
    required this.content, // Nội dung là bắt buộc
    required this.priority, // Mức độ ưu tiên là bắt buộc
    required this.createdAt, // Thời gian tạo là bắt buộc
    required this.modifiedAt, // Thời gian cập nhật là bắt buộc
    this.tags, // Tags là tùy chọn
    this.color, // Màu sắc là tùy chọn
  });

  Note.fromMap(Map<String, dynamic> map) // Named constructor để tạo Note từ Map (dữ liệu từ DB)
      : id = map['id'], // Gán id từ Map
        title = map['title'], // Gán tiêu đề từ Map
        content = map['content'], // Gán nội dung từ Map
        priority = map['priority'], // Gán mức ưu tiên từ Map
        createdAt = DateTime.parse(map['createdAt']), // Chuyển chuỗi thời gian thành DateTime
        modifiedAt = DateTime.parse(map['modifiedAt']), // Tương tự cho thời gian cập nhật
        tags = map['tags'] != null ? List<String>.from(map['tags'].split(',')) : null, // Chuyển chuỗi tags thành List
        color = map['color']; // Gán màu từ Map

  Map<String, dynamic> toMap() { // Phương thức chuyển Note thành Map để lưu vào DB
    return { // Trả về một Map
      'id': id, // Key 'id' ánh xạ tới giá trị id
      'title': title, // Key 'title' ánh xạ tới tiêu đề
      'content': content, // Key 'content' ánh xạ tới nội dung
      'priority': priority, // Key 'priority' ánh xạ tới mức ưu tiên
      'createdAt': createdAt.toIso8601String(), // Chuyển DateTime thành chuỗi ISO
      'modifiedAt': modifiedAt.toIso8601String(), // Tương tự cho modifiedAt
      'tags': tags?.join(','), // Chuyển List tags thành chuỗi, cách nhau bởi dấu phẩy
      'color': color, // Key 'color' ánh xạ tới mã màu
    };
  }

  Note copyWith({ // Phương thức tạo bản sao với các thuộc tính được cập nhật
    int? id, // Các tham số đều là tùy chọn
    String? title,
    String? content,
    int? priority,
    DateTime? createdAt,
    DateTime? modifiedAt,
    List<String>? tags,
    String? color,
  }) {
    return Note( // Trả về một Note mới
      id: id ?? this.id, // Nếu tham số mới là null, giữ giá trị cũ
      title: title ?? this.title, // Tương tự cho title
      content: content ?? this.content, // Tương tự cho content
      priority: priority ?? this.priority,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      tags: tags ?? this.tags,
      color: color ?? this.color,
    );
  }

  @override
  String toString() { // Ghi đè phương thức toString để in thông tin Note
    return 'Note(id: $id, title: $title, priority: $priority)'; // Chuỗi đại diện cho Note
  }
}