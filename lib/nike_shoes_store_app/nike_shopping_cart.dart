
import 'package:flutter/material.dart';
import 'package:nike_shoes/nike_shoes_store_app/nike_shoe.dart';

const _buttonSize= 160.0;
const _buttonCircularSize= 60;


class NikeShoppingCart extends StatefulWidget {
  final NikeShoes shoes;

   
  const NikeShoppingCart({Key? key,  required  this.shoes}) : super(key: key);

  @override
  State<NikeShoppingCart> createState() => _NikeShoppingCartState();
}

class _NikeShoppingCartState extends State<NikeShoppingCart>  with SingleTickerProviderStateMixin{
     late AnimationController _controller;
     late Animation _animationButton1;


  @override
  void initState(){
    _controller= AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    _animationButton1= Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller, 
        curve: const Interval(
          0.0,
          0.2
        ),
        ));


    super.initState();
  }

  void dispose(){
    _controller.dispose();
    super.dispose();
  }


  Widget _buildPanel(){
    final size = MediaQuery.of(context).size;
    return  TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeIn,
                  tween: Tween(begin: 1.0, end: 0.0),
                  builder: (contex, value , child){
                    return Transform.translate(
                      offset: Offset(
                        0.0,
                        value * (size.height * 0.6)
                      ),
                      child: child,
                      );
                  },
                  child: Container(
                    height: size.height * 0.6,
                    decoration: const  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Image.asset(
                                widget.shoes.image.first,
                                width: 200
                              ),
                              const  Spacer(),
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    widget.shoes.model,
                                    style: const TextStyle(
                                      fontSize: 10
                                    )),
                                  Text(
                                    '\$${widget.shoes.currentPrice.toInt().toString()}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12
                                    )
                                  )
                                  ],
                              )
                            ]
                          ),
                        )
                      ]
                    )
                  ),
                );

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material (
      color: Colors.transparent,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, snapshot) {
          return Stack(
            fit: StackFit.expand,
            children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  color: Colors.black87,
                )
              )
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Stack(
                  children: [
                    _buildPanel(),
                     Positioned(
                       bottom: 40,
                       left: size.width / 2 - _buttonSize / 2 ,
                       child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn,
                      tween: Tween(begin: 1.0, end: 0.0),
                      builder: (contex, value , child){
                        return Transform.translate(
                          offset: Offset(
                            0.0,
                            value * (size.height * 0.6)
                          ),
                          child: child,
                          );
                      },
                         child: InkWell(
                           onTap: (){
                             _controller.forward();
                           },
                           child: Container(
                            //  width: ( _buttonSize * _animationButton1.value ).clamp(
                            //    _buttonCircularSize,
                            //    _buttonSize
                            //  ),
                             decoration: const  BoxDecoration(
                               color: Colors.black,
                               borderRadius: BorderRadius.all(Radius.circular(20))
                             ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children:  const [
                                    Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white
                                  ), 
                                    Text(
                                      ' ADD TO CART', 
                                      style : TextStyle(color: Colors.white,
                                      )
                                    )
                                ]
                              ),
                            )
                                         ),
                         ),
                       ),
                     )
      
                    
      
      
                  ],
              
                ),
              )
      
            ]
      
          );
        }
      )
   
    );
  }
}