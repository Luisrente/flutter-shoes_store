
import 'package:flutter/material.dart';
import 'package:nike_shoes/nike_shoes_store_app/nike_shoe.dart';
import 'package:nike_shoes/nike_shoes_store_app/nike_shopping_cart.dart';

import '../widget/widgets.dart';

class NikeShoesDetails extends StatelessWidget {
  final NikeShoes shoes;
  final ValueNotifier<bool> notifierButtonsVisible = ValueNotifier(false);
  NikeShoesDetails({Key? key,  required this.shoes}) : super(key: key);
  void _openShoppingCart(BuildContext context) async{
    notifierButtonsVisible.value= false;
    await  Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, animation1, __){
      return FadeTransition(
        opacity: animation1,
        child:  NikeShoppingCart( shoes: shoes ),
      );
    }
    )
    );
    notifierButtonsVisible.value= true;

  }


  Widget _buildCarousel( BuildContext context){
      final size = MediaQuery.of(context).size;
    return  SizedBox(
                  height: size.height * 0.5,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Hero(
                          tag: 'background_${shoes.model}',
                          child: Container(
                            color: Color(shoes.color),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 70,
                        right: 70,
                        top: 1,
                        child: Hero(
                          tag: 'number_${shoes.model}',
                          child: ShakeTransition(
                            axis: Axis.vertical,
                            duration: const Duration(milliseconds: 1500),
                            offset: 20,
                            child: Material (
                              color: Colors.transparent,
                              child: FittedBox(
                              child: Text( shoes.modelnumber.toString(),
                              style :  TextStyle( 
                                color: Colors.red.withOpacity( 0.02 ),
                                fontSize: 100
                                )
                               ),
                            ),),
                          )
                        )
                      ),
                      PageView.builder(
                        itemCount: shoes.image.length,
                        itemBuilder: (context, index){
                          final tag = index == 0 ? 'image_${shoes.model} ': 'image_${shoes.model}_$index' ;
                          return Container(
                            alignment: Alignment.center,
                            child: ShakeTransition(
                              axis: Axis.vertical,
                              duration: index == 0 ? const Duration(milliseconds: 900) : Duration.zero,
                              offset: 10,
                              child: Hero(
                                tag: 'image_${shoes.model}',
                                child: Image.asset(
                                  shoes.image[index],
                                  height: 200,
                                  width: 200
                                ),
                              ),
                            )
                          );
                        }
                      )
                    ]
                  )
                );

  }
  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance!.addPostFrameCallback((_){
    notifierButtonsVisible.value= true;
  });

  final size = MediaQuery.of(context).size;

    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true, 
        title: Image.asset(
          'assets/nike_logo.png'
          , height: 40,
        ),
        leading:  const BackButton(
          color: Colors.black
        )
      ),
      body: Stack(
        fit: StackFit.expand,
        children:[
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:[
                _buildCarousel(context),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column( 
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  ShakeTransition(
                    axis: Axis.horizontal,
                    duration: const Duration(milliseconds: 3000),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Text(
                        shoes.model, 
                        style: const TextStyle(
                          color: Colors.black, 
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:[
                                           Text(
                          '\$${shoes.oldPrice.toInt().toString()}', 
                          style: const TextStyle(
                            color: Colors.red, 
                            decoration: TextDecoration.lineThrough,
                            fontSize: 13,
                          ),
                          ),
                          Text(
                          '\$${shoes.currentPrice.toInt().toString()}', 
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                            ]
                          ),
                        )
                      ]
                    ),
                  ),
                  const SizedBox(height: 20),
                  const ShakeTransition(
                    axis: Axis.horizontal,
                    child:  Text('AVAIBLE SIZES' , style : TextStyle(fontSize: 12))),
                  const SizedBox(height: 20),
                  ShakeTransition(
                    axis: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const  [
                        _ShoesSizeItem(text: '6'),
                        _ShoesSizeItem(text: '7'),
                        _ShoesSizeItem(text: '8'),
                        _ShoesSizeItem(text: '9'),
                        _ShoesSizeItem(text: '10'),
                      ]
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('DESCRIPTION' , style : TextStyle(fontSize: 11)),
                  const SizedBox(height: 20),

                  ]
                  ),
                )
              ]
            )
          ),
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
                        onPressed: (){
                          _openShoppingCart(context);
                        }
                        )
                    ]
                  ),
                ),
            builder: (context, value, child) {
              return AnimatedPositioned(
                left: 0,
                right: 0,
                bottom: value ? 0.0 : -kToolbarHeight * 1.5,
                duration: const Duration(milliseconds: 300),
                child: child!,
              );
            }
          )

        ]
      )
    );
  }


}

class _ShoesSizeItem  extends StatelessWidget {

  final String text;

  const _ShoesSizeItem ({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        'US $text', 
        style:  const TextStyle(
        fontWeight: FontWeight.bold
      ))
    );
  }
}