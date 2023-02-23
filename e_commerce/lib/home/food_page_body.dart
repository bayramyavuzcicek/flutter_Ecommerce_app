import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:e_commerce/widgets/icon_and_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor= 0.8;
  double _height= 220;
  
  @override
  void initState (){
    super.initState();
    pageController.addListener(() { 
      setState(() {
        _currPageValue =  pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
  Matrix4 matrix = new Matrix4.identity();
  
  if(index == _currPageValue.floor()){ // responsible with current one
    var currScale = 1-(_currPageValue - index)*(1-_scaleFactor);
    var currTrans = _height*(1-currScale)/2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

  }else if(index == _currPageValue.floor()+1){ // responsible with next one
    var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
    var currTrans = _height*(1-currScale)/2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

  }else if(index == _currPageValue.floor()-1){ // responsible with previous one
    var currScale = 1-(_currPageValue - index)*(1-_scaleFactor);
    var currTrans = _height*(1-currScale)/2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
  }
  else{
    var currScale = 0.8;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);

  }

  return Transform(
    transform: matrix,
    child: Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.amber,
            image: DecorationImage(
              image: AssetImage("assets/images/food6.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Container(
              decoration: BoxDecoration(
                
              ),
              padding: EdgeInsets.only(
                top: 10,
                left: 15,
                right: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Antalya Piyazı"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: AppColors.mainColor,
                                size: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "4.5"),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "1287 comments"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          IconAndTextWidget(
                            icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: AppColors.iconColor1,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          IconAndTextWidget(
                            icon: Icons.location_on,
                            text: "1.7km",
                            iconColor: AppColors.mainColor,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          IconAndTextWidget(
                            icon: Icons.access_time_rounded,
                            text: "32min",
                            iconColor: AppColors.iconColor2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

}

