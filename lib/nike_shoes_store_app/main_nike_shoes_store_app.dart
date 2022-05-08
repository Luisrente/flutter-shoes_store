
import 'package:flutter/material.dart';
import 'package:nike_shoes/nike_shoes_store_app/nike_shoe.dart';
import 'package:nike_shoes/nike_shoes_store_app/nike_shoes_details.dart';

class NikeShoesStoreHome extends StatelessWidget {

   
   NikeShoesStoreHome({Key? key}) : super(key: key);

  final ValueNotifier<bool> notifierBottomBarVisible= ValueNotifier(true);

  void _onShoesPressed(NikeShoes shoes, BuildContext context ) async {
    notifierBottomBarVisible.value= false;
    await Navigator.of(context).push(
      PageRouteBuilder(pageBuilder: (context, animation1, animation2){
        return FadeTransition(
          opacity: animation1,
          child:  NikeShoesDetails(
            shoes: shoes
          ),
        );
      }
    )
    );
        notifierBottomBarVisible.value= true;

  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack (
        children: [
          Padding(
          padding: const EdgeInsets.only(left: 20.0 , top: 20.0 , right:20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              Image.asset(
                'assets/nike_logo.png',
                height: 40 
                ),
              Expanded(
                //Para que ocupe todo el espacio
                child: ListView.builder(
                  itemCount: shoes.length,
                  padding: const EdgeInsets.only(bottom: 20),
                  itemBuilder: (context, index){
                    final shoesItem= shoes[index];
                    return NikeShoesItem(
                      shoesItem: shoesItem,
                      onTap: (){
                        _onShoesPressed(shoesItem, context);
                      }
                      );
                  }
                  )
              )  
            ]
          ),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: notifierBottomBarVisible,
          child: Container(
                color: Colors.white.withOpacity(0.8),
                child: Row(
                  children: const [
                    Expanded(
                      child: Icon(Icons.home)
                    ),
                    Expanded(
                      child: Icon(Icons.search)
                    ),
                    Expanded(
                      child: Icon(Icons.favorite_border)
                    ),
                    Expanded(
                      child: Icon(Icons.shopping_cart)
                    ),
                    Expanded(
                      child: Center(
                        child: CircleAvatar(
                          radius: 13,
                          backgroundImage: AssetImage('assets/feet.png')
                        )
                      )
                    ),
                  ]
                ),
              ),
          builder: (context, value, child) {
            return AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              left: 0,
              right: 0,
              bottom: value ? 0.0 : -kToolbarHeight,
              height: kToolbarHeight,
              child: child!, 
            );
          }
        )
        ]
      ),  
    );
  }
} 


class NikeShoesItem extends StatelessWidget {

  final NikeShoes shoesItem;
  final VoidCallback onTap;
  const NikeShoesItem({Key? key, required this.shoesItem, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     double itemHeight= 300.0;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: SizedBox(
          height: itemHeight,
          child: Stack(
           fit: StackFit.expand,
           children: [
             //positions.fill para que ocupe todo el espacio
             Positioned.fill(
               child: Container(
                 decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20.0),
                 color: Color(shoesItem.color),
                 )
               ),
             ),
             Align(
               alignment: Alignment.topCenter,
               child: SizedBox(
                 height: itemHeight * 0.6,
                 child: FittedBox(
                   child:  Text(
                     shoesItem.modelnumber.toString(),
                     style :  TextStyle( color: Colors.black.withOpacity( 0.02 ),)
                    ),
                 ),
               ),
             ),
             Positioned(
               top: 20,
               left: 90,
               height: itemHeight * 0.6,
               child: Image.asset(
                 shoesItem.image.first,
                 fit : BoxFit.contain
               )
             ),
            const Positioned(
               bottom: 20,
               left: 0,
               child: Icon(
                 Icons.favorite_border,
                 color: Colors.grey
               )
               ),
            const Positioned(
               bottom: 20,
               right: 0,
               child: Icon(
                 Icons.shopping_bag_outlined,
                 color: Colors.grey
               )
               ),
             Positioned(
               left: 0,
               right: 0,
               bottom: 25,
               child: Column(
                 crossAxisAlignment:  CrossAxisAlignment.center,
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Text(
                     shoesItem.model, 
                     style: const TextStyle(color: Colors.grey)
                     ),
                   const SizedBox( height: 10),  
                   Text(
                     shoesItem.oldPrice.toInt().toString(),
                     style: const TextStyle(
                       color: Colors.red,
                       decoration: TextDecoration.lineThrough
                       )
                     ),
                   const SizedBox( height: 10),  
                   Text(
                     '\$${shoesItem.currentPrice.toInt().toString()}',
                     style: const TextStyle(
                       color: Colors.black,
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       )
                     )
                 ],
               )
             )  
           ]
          ),
        ),
      ),
    );
  }
}