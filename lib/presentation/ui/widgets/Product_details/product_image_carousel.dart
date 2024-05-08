import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/utility/app_color.dart';
import 'package:flutter/material.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({
    super.key, this.height, required this.urls,
  });

  final double? height;
  final List<String> urls;

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 220.0,
            onPageChanged: (index, reason){
                _currentIndex.value = index;
            },
            viewportFraction: 1,
            autoPlay: true

          ),
          items: widget.urls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                      image: DecorationImage(image: NetworkImage(url))
                    ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 6,),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, index,_){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i = 0; i < 5; i++)
                      Container(
                        height: 14,
                        width: 14,
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: i == index ? AppColors.primaryColor : Colors.white,
                          border: Border.all(
                            color: i == index ? AppColors.primaryColor : Colors.white
                          ),
                          borderRadius: BorderRadius.circular(30)
                        ),
                      )
                  ],
                );
              }
          ),
        )
      ],
    );
  }
}
