void main() {
  int diemToan = 8;
  int diemVan = 7;
  int tongDiem = 0;

  //Cộng điểm từng môn
  tongDiem += diemToan;
  tongDiem += diemVan;
  //tính điểm trung bình
  double diemTB = tongDiem / 2;
  // gán điểm đạt/ không đạt
  String? KetQua;
  KetQua ??= 'Chua xet';
  if (diemTB >= 5) {
    KetQua = 'Dat';
  }
  print('Diem TB: $diemTB');
  print('ket qua: $KetQua');
}
