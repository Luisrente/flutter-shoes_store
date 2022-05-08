
import 'package:flutter/material.dart';
import 'package:nike_shoes/nike_shoes_store_app/nike_shoe.dart';

class NikeShoesDetails extends StatelessWidget {
  final NikeShoes shoes;
  final ValueNotifier<bool> notifierButtonsVisible = ValueNotifier(false);
   
  NikeShoesDetails({Key? key,  required this.shoes}) : super(key: key);

 
  
  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance!.addPostFrameCallback((_){
    notifierButtonsVisible.value= true;
  });
    return  Scaffold(
      appBar: AppBar(
      ),
      body: Stack(
        children:[
          ValueListenableBuilder<bool>(
            valueListenable: notifierButtonsVisible,
            child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      FloatingActionButton(
                        heroTag: 'fav_1',
                        backgroundColor: Colors.white,
                        child: const Icon(Icons.favorite, color: Colors.black),
                        onPressed: (){}
                        ),
                      const  Spacer(),
                      FloatingActionButton(
                        heroTag: 'fav_2',
                        backgroundColor: Colors.black,
                        child: const Icon(Icons.shopping_cart),
                        onPressed: (){}
                        )
          
                    ]
                  ),
                ),
            builder: (context, value, child) {
              return AnimatedPositioned(
                left: 0,
                right: 0,
                bottom: value ? 0.0 : -kToolbarHeight,
                duration: const Duration(milliseconds: 250),
                child: child!,
              );
            }
          )

        ]
      )
    );
  }
}