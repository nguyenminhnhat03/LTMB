import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormBasicDemo6 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FormBasicDemoState();

}

class _FormBasicDemoState extends State<FormBasicDemo6>{
  final _formkey = GlobalKey<FormState>();
  String? _name;

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  String? _gender;
  String? _selectCity;
  bool _obscurePassword = true;
DateTime? _dateOfBirth;


  bool _isAgreed = false;
  final List<String> _cities=['Hà Nội', 'TP.HCM', 'Đà Nẵng','Hải Phòng','Cần Thơ'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Cơ bản"),
      ),

      body: Padding(padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
         child: SingleChildScrollView(
           child: Column(
             children: [
               TextFormField(
                 controller: _fullNameController,
                 decoration: InputDecoration(
                   labelText: "Họ và tên",
                   hintText: "Nhập họ và tên của bạn",
                   border: OutlineInputBorder(),
                 ),
                 onSaved: (value){
                   _name =value;
                 },
                 autovalidateMode: AutovalidateMode.onUserInteraction,
                 validator: (value){
                   if(value == null||value.isEmpty){
                     return("Vui lòng nhập họ và tên");
                   }
                   return null;
                 },
               ),



               Text(
                 'Giới tính',
                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
               ),
               SizedBox(height: 20),
               FormField<String>(
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Vui lòng chọn giới tính';
                   }
                   return null;
                 },
                 initialValue: _gender,
                 builder: (FormFieldState<String> state) {
                   return Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       RadioListTile<String>(
                         title: Text('Nam'),
                         value: 'male',
                         groupValue: _gender,
                         onChanged: (value) {
                           setState(() {
                             _gender = value;
                             state.didChange(value);
                           });
                         },
                       ),
                       RadioListTile<String>(
                         title: Text('Nữ'),
                         value: 'female',
                         groupValue: _gender,
                         onChanged: (value) {
                           setState(() {
                             _gender = value;
                             state.didChange(value);
                           });
                         },
                       ),

                       if (state.hasError)
                         Padding(
                           padding: EdgeInsets.only(left: 12),
                           child: Text(
                             state.errorText!,
                             style: TextStyle(color: Colors.red, fontSize: 12),
                           ),
                         ),
                     ],
                   );
                 },
               ),
               SizedBox(height: 20,),
               TextFormField(
                 controller: _dateOfBirthController,
                 decoration: InputDecoration(
                   labelText: 'Ngày Sinh',
                   hintText: 'Chọn ngày sinh của bạn',
                   prefixIcon: Icon(Icons.calendar_today),
                   border: OutlineInputBorder(),
                 ),
                 readOnly: true,
                 onTap: () async{
                   DateTime? picketDate = await showDatePicker(
                       context: context,
                       firstDate: DateTime(1900),
                       lastDate: DateTime(2025));

                   if(picketDate!=null){
                     String formattebDate = DateFormat("dd/MM/yyyy").format(picketDate);
                     setState(() {
                       _dateOfBirthController.text=formattebDate;
                       _dateOfBirth=picketDate;
                     });
                   }
                 },
                 validator: (value){
                   if(value==null || value.isEmpty){
                     return "Vui  lòng chọn ngày sinh";
                   }
                 },
               ),



               TextFormField(
                 controller: _emailController,
                 decoration: InputDecoration(
                   labelText: 'Email',
                   hintText: 'example@gmail.com',
                   prefixIcon: Icon(Icons.email),
                   border: OutlineInputBorder(),
                 ),
                 keyboardType: TextInputType.emailAddress,
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Vui lòng nhập email';
                   }
                   if (!RegExp(
                     r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                   ).hasMatch(value)) {
                     return 'Email không hợp lệ';
                   }
                   return null;
                 },
               ),

               SizedBox(height: 20),

               // Số điện thoại
               TextFormField(
                 controller: _phoneController,
                 decoration: InputDecoration(
                   labelText: 'Số điện thoại',
                   hintText: 'Nhập số điện thoại của bạn',
                   prefixIcon: Icon(Icons.phone),
                   border: OutlineInputBorder(),
                 ),
                 keyboardType: TextInputType.phone,
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Vui lòng nhập số điện thoại';
                   }
                   if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                     return 'Số điện thoại phải có 10 chữ số';
                   }
                   return null;
                 },
               ),

               SizedBox(height: 16),

               // Password field
               TextFormField(
                 controller: _passwordController,
                 decoration: InputDecoration(
                   labelText: 'Mật khẩu',
                   hintText: 'Nhập mật khẩu',
                   prefixIcon: Icon(Icons.lock),
                   suffixIcon: IconButton(
                     icon: Icon(
                       _obscurePassword
                           ? Icons.visibility
                           : Icons.visibility_off,
                     ),
                     onPressed: () {
                       setState(() {
                         _obscurePassword = !_obscurePassword;
                       });
                     },
                   ),
                   border: OutlineInputBorder(),
                 ),
                 obscureText: _obscurePassword,
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Vui lòng nhập mật khẩu';
                   }
                   if (value.length < 6) {
                     return 'Mật khẩu phải có ít nhất 6 ký tự';
                   }
                   return null;
                 },
               ),
               SizedBox(height: 16),

               // Xác nhận mật khẩu
               TextFormField(
                 controller: _confirmPasswordController,
                 decoration: InputDecoration(
                   labelText: 'Xác nhận mật khẩu',
                   hintText: 'Nhập lại mật khẩu của bạn',
                   prefixIcon: Icon(Icons.lock_outline),
                   border: OutlineInputBorder(),
                 ),
                 obscureText: true,
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Vui lòng xác nhận mật khẩu';
                   }
                   if (value != _passwordController.text) {
                     return 'Mật khẩu không khớp';
                   }
                   return null;
                 },
               ),




               SizedBox(height: 16,),
               DropdownButtonFormField(
                 decoration: InputDecoration(
                   labelText: "Thành Phố",
                   border: OutlineInputBorder(),
                 ),
                 items: _cities.map((city){
                   return DropdownMenuItem(child:
                   Text(city),
                       value: city);

                 }).toList(),
                 onChanged: (value){},
                 validator: (value){
                   if(value == null || value.isEmpty){
                     return "Vui lòng chọn thành phố";
                   }
                   return null;
                 },
               ),





               SizedBox(height: 20,),
               CheckboxListTile(
                 title: Text("bạn đồng ý với điều khoản của công ty ABC!"),
                 value: _isAgreed,
                 onChanged: (value){
                   setState(() {
                     _isAgreed=value!;
                     print("Đồng Ý: $_isAgreed");

                   });
                 },
                 controlAffinity: ListTileControlAffinity.leading,
               ),





               SizedBox(height: 20),
               Row(
                 children: [
                   ElevatedButton(onPressed:(){
                     if(_formkey.currentState!.validate()){
                       _formkey.currentState!.save();
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Xin chào $_name")));
                     }
                   }, child: Text("Submit")),
                   SizedBox(width: 20,),
                   ElevatedButton(onPressed:(){
                     _formkey.currentState!.reset();
                     setState(() {
                       _name = null;
                       _dateOfBirthController.text= " ";
                     });

                   }, child: Text("Reset")),
                 ],
               )
             ],
           ),
         ),
        ),
      ),

    );
  }
}
