
import 'package:flutter/material.dart';


PreferredSize customAppBar({required BuildContext context}){
  return  PreferredSize(preferredSize: Size.fromHeight(124.0), child: SafeArea(
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Image.asset('assets/images/menu.png', width: 50,height: 50,),
                  Image.asset('assets/images/img_1.png', width: 123,height: 123,),

                ],
              ),
            ),
          )


        ],
      ),
    ),
  ));
}