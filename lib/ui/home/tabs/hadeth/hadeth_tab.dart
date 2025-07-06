import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/hadeth/hadeth_item.dart';

class HadethTab extends StatelessWidget {
  HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.02),
      child: CarouselSlider(
        options: CarouselOptions(
          height: height * 0.66,
          enlargeCenterPage: true,
        ),
        items: List.generate(50, (index) => index + 1).map((index) {
          return HadethItem(index: index);
        }).toList(),
      ),
    );
  }
}
