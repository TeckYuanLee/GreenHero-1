import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose your  🌿\n new eco companion',
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'CATEGORIES',
                  style: TextStyle(
                      height: 1.sp,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 3.w),
                  child: Container(
                    height: 7.h,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Category('All Products'),
                        Category('Home & Living'),
                        Category('Outdoors'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Product(),
                        Product(),
                      ],
                    ),
                    Row(
                      children: [
                        Product(),
                        Product(),
                      ],
                    ),
                    Row(
                      children: [
                        Product(),
                        Product(),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class ImageCard extends StatelessWidget {
//   const ImageCard({this.imageData});
//
//   final ImageData imageData;
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(16.0),
//       child: Image.network(imageData.imageUrl, fit: BoxFit.cover),
//     );
//   }
// }

class Product extends StatelessWidget {
  const Product({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.w),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 2.0,
                spreadRadius: 1.0,
              ),
            ],
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              children: [
                Image.network(
                  'https://www.brushwithbamboo.com/wp-content/uploads/2018/01/adult-single-no-cert.jpg',
                  height: 20.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bamboo Toothbrush'),
                    Text(
                      'RM 5.00',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  Category(this.category);

  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5.0),
      child: Container(
        child: Center(
          child: Text(
            category,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 2.0,
              spreadRadius: 1.0,
            ),
          ],
          borderRadius: BorderRadius.circular(15.0),
          color: Theme.of(context).accentColor,
        ),
        width: 35.w,
      ),
    );
  }
}
