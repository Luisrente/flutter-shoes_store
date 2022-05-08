
class NikeShoes {

  NikeShoes({
    required this.model, 
    required this.oldPrice, 
    required this.currentPrice, 
    required this.image, 
    required this.modelnumber,
    required this.color,
   });


  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String> image;
  final int modelnumber;
  final int color;
}

  final shoes= <NikeShoes>[

    NikeShoes(
       model: 'AIR MAX 90 EZ BLACK', 
       oldPrice: 299, 
       currentPrice: 149,
       image: [
      'assets/shoes2_1.png',
      'assets/shoes2_2.png',
      'assets/shoes2_3.png',
      ],
       modelnumber: 90,
       color: 0xFFF6F6F6
    ),

    NikeShoes(
       model: 'AIR MAX 95 red', 
       oldPrice: 149, 
       currentPrice: 229,
       image: [
      'assets/shoes2_1.png',
      'assets/shoes2_2.png',
      'assets/shoes2_3.png',
      ],
       modelnumber: 90,
       color: 0XFFFEFFDE

    ),
    NikeShoes(
       model: 'AIR MAX 270 Gold', 
       oldPrice: 349, 
       currentPrice: 149,
       image: [
      'assets/shoes3_1.png',
      'assets/shoes3_2.png',
      'assets/shoes3_3.png',
      ],
       modelnumber: 90,
       color: 0XFFFEEFEF
    ),

    NikeShoes(
       model: 'AIR MAX 98 free', 
       oldPrice: 349, 
       currentPrice: 149,
       image: [
      'assets/shoes4_1.png',
      'assets/shoes4_2.png',
      'assets/shoes4_3.png',
      ],
       modelnumber: 90,
       color: 0XFFEDF3FE

    ),

  ];


  
