
import 'dart:io';

import 'package:developer_test_app/components/custom_appBar.dart';
import 'package:developer_test_app/view_model/order_view_model.dart';
import 'package:developer_test_app/views/order_setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:developer_test_app/models/note_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {

  bool edit = false;
  bool filled = false;
  int index = 0;

 String quantity = '0';

  TextEditingController itemController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController   noteController = TextEditingController();

  List<String> listItems = [
    "Pepper", "Fish", "Garlic","Lobster", "Broccoli", "Apple", "Cashews", "Salmon","Macadamia nuts", "Cheese", "Sunflower seeds", "Ketchup", "Walnuts", "Mayonnaise", "Bread", "Iced tea", "Grapes", "Beef", "Coffee", "Cornflakes", "Turmeric",
     "Cucumber", "Mustard", "Lettuce", "Banana", "Butter"
  ];

  List<Note> notes = List.empty(growable: true);


  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);


      if (pickedFile != null) {
        _image = File(pickedFile.path);

        setState(() {

        });
      } else {
        print('No image selected.');

      }

  }


  @override
  Widget build(BuildContext context) {


    final orderViewModel = Provider.of<OrderViewModel>(context);
    return Scaffold(
      appBar: customAppBar(context: context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              if(edit)
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
        
                    IconButton(onPressed: (){
                      edit = false;
                      setState(() {
        
                      });
                    }, icon: const Icon(Icons.cancel_presentation, color: Colors.grey,)),
        
                    IconButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const OrderSettingScreen()));
        
                    }, icon: const Icon(Icons.arrow_forward, color: Colors.grey,)),
                    // const SizedBox(width: 5,),
                  ],
                ),
              ),
        
              Row(
                children: [
                  const Text('Order#', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: Color(0XFF5000B9)),),
                  InkWell(onTap: (){
                    edit = true;
                    setState(() {
        
                    });
                  },child: const Text("112 (allow edit)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0XFF006B83),))
                  )],
              )
              ,
              const SizedBox(height: 15.0,)
              ,
              Table(
                columnWidths: const {
              0:  FractionColumnWidth(0.13),
              1: FractionColumnWidth(0.86)
        
              },
                border: TableBorder.symmetric(inside: const BorderSide(color: Color(0XFF006B83))),
               children:  [
        
        
                 // edit == true && filled == true && index==1 ? true : false,
        
        
        
                 TableRow(
                     children: [
        
        
        
                       Autocomplete( optionsBuilder: (TextEditingValue textEditingValue){
                         if(textEditingValue.text == ''){
                           return const Iterable<String>.empty();
                         }
                         return listItems.where((String item)  {
                           return item.contains(textEditingValue.text.toLowerCase());
                         });
                       }, onSelected: (String item){
        
                         quantity = item;
        
                         orderViewModel.setQuantity(quantity);
        
                       },
                           fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                             return TextField(
                                 controller: textEditingController,
                                 keyboardType: TextInputType.number,
                                 focusNode: fieldFocusNode,
                                 enabled: edit
        
                             );
                           }
                       ),
                       InkWell(
                         onDoubleTap: (){
                          showDialog(barrierDismissible: false,context: context, builder: (context){
        
                            return  AlertDialog(
        
                              title: const Text("Add Notes"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    controller: noteController,
                                    decoration: const InputDecoration(
                                      hintText: 'Add notes'
                                    )
                                  ),
        
                                  TextButton(onPressed: (){
                                    getImage();
                                  }, child: const Text('Upload Image')),
        
                                  _image == null
                                      ? const Text('No image selected.')
                                      : Image.file(_image!),
        
                                  TextButton(onPressed: (){
                                    Navigator.of(context).pop();
                                  }, child: const Text('Cancel'))
                                ],
                              ),
                            );
                          });
                         },
                         child: Row(
                           children: [
        
                             Container(
                               width: MediaQuery.of(context).size.width * 0.6,
                               child: Autocomplete( optionsBuilder: (TextEditingValue textEditingValue){
                                 if(textEditingValue.text == ''){
                                   return const Iterable<String>.empty();
                                 }
                                 return listItems.where((String item)  {
                                   return item.contains(textEditingValue.text.toLowerCase());
                                 });
                               }, onSelected: (String item){
        
                                 addNote(Note(quantity: quantity, body: item));
        
                                 for(int i=0;i<notes.length;i++){
                                   print(notes[i].body.length);
                                 }
        
                                 setState(() {
                                   filled = true;
                                   index++;
                                 });
        
                               },
                                   fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                                     return TextField(
                                       controller: textEditingController,
                                       focusNode: fieldFocusNode,
                                       enabled: edit
        
                                     );
                                   }
                               ),
                             ),
        
                             Row(
                               children: [
                                 if(_image!=null)
                                   Icon(Icons.camera_alt)
                                 ,
                                 if(noteController.text != '')
                                   Icon(Icons.info_outline)
                               ],
                             )
        
                           ],
                         )
                       )
        
                     ]
                 ),
        
        
              
                 for(int i=0;i<20;i++)
                   TableRow(
                       children: [
        
        
                         // Padding(
                         //   padding: const EdgeInsets.only(left: 0.0),
                         //   child: TextFormField(
                         //     enabled: edit,
                         //     keyboardType: TextInputType.number,
                         //     controller: quantityController,
                         //   ),
                         // ),
        
                         Autocomplete( optionsBuilder: (TextEditingValue textEditingValue){
                           if(textEditingValue.text == ''){
                             return const Iterable<String>.empty();
                           }
                           return listItems.where((String item)  {
                             return item.contains(textEditingValue.text.toLowerCase());
                           });
                         }, onSelected: (String item){
        
                           quantity = item;
        
        
        
                         },
                             fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                               return TextField(
                                 controller: textEditingController,
                                 keyboardType: TextInputType.number,
                                 focusNode: fieldFocusNode,
                                 enabled: edit == true && filled == true && index==i+1 ? true : false,
        
                               );
                             }
                         ),
                         InkWell(
                             onDoubleTap: (){
                               showDialog(barrierDismissible: false,context: context, builder: (context){
        
                                 return  AlertDialog(
        
                                   title: const Text("Add Notes"),
                                   content: Column(
                                     mainAxisSize: MainAxisSize.min,
                                     children: [
                                       TextFormField(
                                           controller: noteController,
                                           decoration: const InputDecoration(
                                               hintText: 'Add notes'
                                           )
                                       ),
        
                                       TextButton(onPressed: (){
                                         getImage();
                                       }, child: const Text('Upload Image')),
        
                                       _image == null
                                           ? const Text('No image selected.')
                                           : Image.file(_image!),
        
                                       TextButton(onPressed: (){
                                         Navigator.of(context).pop();
                                       }, child: const Text('Cancel'))
                                     ],
                                   ),
                                 );
                               });
                             },
                             child: Row(
                               children: [
        
                                 Container(
                                   width: MediaQuery.of(context).size.width * 0.6,
                                   child: Autocomplete( optionsBuilder: (TextEditingValue textEditingValue){
                                     if(textEditingValue.text == ''){
                                       return const Iterable<String>.empty();
                                     }
                                     return listItems.where((String item)  {
                                       return item.contains(textEditingValue.text.toLowerCase());
                                     });
                                   }, onSelected: (String item){
        
                                     addNote(Note(quantity: quantity, body: item));
                                     //
                                     // for(int i=0;i<notes.length;i++){
                                     //   print(notes[i].body.length);
                                     // }
        
                                     setState(() {
                                       filled = true;
                                       index++;
                                     });
        
                                   },
                                       fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                                         return TextField(
                                           controller: textEditingController,
                                           focusNode: fieldFocusNode,
                                           enabled: edit == true && filled == true && index==i+1 ? true : false,
        
                                         );
                                       }
                                   ),
                                 ),
        
                                 Row(
                                   children: [
                                     if(_image!=null)
                                       Icon(Icons.camera_alt)
                                     ,
        
                                   ],
                                 )
        
                               ],
                             )
                         )
        
                       ]
                   ),
        
        
        
        
        
        
        
        
        
        
               ]
              ),
        
        
            ],
          ),
        ),
      ),

    );

  }



  void addNote(Note n){
    notes.add(n);


    setState(() {

    });
  }
}



