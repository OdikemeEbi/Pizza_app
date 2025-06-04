import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pizaa_app/data/pizza_data.dart';
import 'package:pizaa_app/screens/cart_screen.dart';
import 'package:pizaa_app/screens/pizza_detail_screen.dart';
import 'package:pizaa_app/screens/widgets/custom_button.dart';
import 'package:pizaa_app/utils/constants/app_colors.dart';
import 'package:pizaa_app/utils/constants/image_constants.dart';
import 'package:pizaa_app/utils/constants/text_constants.dart';
import 'package:pizaa_app/utils/constants/widgets/custom_fav_icon.dart';
import 'package:pizaa_app/utils/constants/widgets/textstyle.dart';

class PizzaPage extends StatelessWidget {
  const PizzaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(ImageConstants.logo),
                Text(
                  TextConstants.pizza,
                  style: TextStyle(
                    color: AppColors.goldColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.goldColor,
                  size: 12,
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  TextConstants.cairo,
                  style: AppTextStyles.text11,
                ),
                SizedBox(
                  width: 3,
                ),
                SvgPicture.asset(
                  ImageConstants.flag,
                  color: Colors.blue,
                ),
                SizedBox(width: 2),
                Icon(Icons.keyboard_arrow_down)
              ],
            ),
            Stack(
              children: [
               
           
                   GestureDetector(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => 
                    CartScreen()));
                   }, child: CutomFavIcon()),

                   Positioned(child: CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColors.yellowColor,
                    child: Text('${pizzaCartList.length}', style: AppTextStyles.text14,),
                   ))
                
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          // Pizza lady card section
          _buildPizzaLadySection(),
          // Pizza grid section
          _searchSection(),

          /// All pizza cards Gridview section

          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
                itemCount: pizzaData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.60, crossAxisSpacing: 20, mainAxisSpacing: 0),
                itemBuilder: (context, int index) {
                  final model = pizzaData[index];
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: index.isOdd ? 0 : 60, bottom: index.isEven ? 0 : 60),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PizzaDetail(
                                      pizzaDetails: model,
                                    ))),
                        child: PizzaCard(model: model),
                      ),
                    ),
                  );
                }),
          ))
        ],
      ),
    );
  }

  /// This method returns a widget containing a stack of containers and an image.
  /// The containers are used to create a gradient effect in the background,
  /// and the image is a picture of a chef.
  Widget _buildPizzaLadySection() {
    return Stack(
      children: [
        /// The containers shown in the background
        Container(
          padding: EdgeInsets.all(30),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            height: 110,
            decoration: BoxDecoration(
              color: AppColors.yellowColor.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(30),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.yellowColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),

        /// This main container housing all designs
        Container(
          padding: EdgeInsets.all(30),
          child: Container(
            height: 101,
            decoration: BoxDecoration(
              color: AppColors.checfBgColor,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),

        /// The checf Image
        Positioned(
          right: 45,
          top: 7,
          child: Image.asset(ImageConstants.pizzaLady1),
        ),
      ],
    );
  }

  /// Returns a Row widget containing a TextFormField for user search input.
  Widget _searchSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: TextFormField(
                cursorColor: AppColors.graeColor.withValues(alpha: 0.3),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: TextConstants.searchForFav,
                    hintStyle: AppTextStyles.text11.copyWith(fontSize: 12),
                    filled: true,
                    fillColor: AppColors.checfBgColor,
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide(color: AppColors.graeColor.withValues(alpha: 0.3), width: 2)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide(color: AppColors.graeColor.withValues(alpha: 0.3), width: 2)),
                    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide(color: AppColors.graeColor.withValues(alpha: 0.3), width: 2))
                    // border: OutlineInputBorder(
                    //   // borderRadius: BorderRadius.circular(18),

                    // )
                    ),
              )),
          SizedBox(width: 18),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
                color: AppColors.amberColor.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(18), border: Border.all(color: AppColors.graeColor.withValues(alpha: 0.3), width: 2)),
            child: Icon(
              Icons.favorite_outline_outlined,
              size: 18,
            ),
          )),
        ],
      ),
    );
  }
}

class PizzaCard extends StatefulWidget {
  final PizzaModel model;

  const PizzaCard({super.key, required this.model});

  @override
  State<PizzaCard> createState() => _PizzaCardState();
}

class _PizzaCardState extends State<PizzaCard> {
  bool isFav = false; // variable to toggle the color

  // the method to toggle/change the color
  void toggleFav(){
    setState(() {
      isFav = !isFav;
    });
  }

  /// Method to add item to cart
  void addItemToCart() {
    setState(() {
      pizzaCartList.add(widget.model);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 
    Text('Item Succesfully added to cart')));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 40, bottom: 10),
          // width: 174,
          // height: 180 ,
          decoration: BoxDecoration(
            color: AppColors.checfBgColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.model.name,
                style: AppTextStyles.text14,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Image.asset(ImageConstants.flash),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    widget.model.description,
                    style: AppTextStyles.text11,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.model.price,
                style: AppTextStyles.text14,
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
          left: 55,
          child: CircleAvatar(
            radius: 35,
            backgroundColor: AppColors.graeColor.withValues(alpha: 0.5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                widget.model.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
            right: 0,
            top: 20,
            child: SizedBox(
                child: GestureDetector(
                  onTap: (){
                        addItemToCart();
                        toggleFav();
                  },
                  child: CutomFavIcon(
                    color: isFav ? AppColors.yellowColor : AppColors.checfBgColor,
                                size: 10,
                              ),
                ))),
        Positioned(
            left: 50,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: AppColors.yellowColor),
              child: Text(
                TextConstants.orderNow,
                style: AppTextStyles.text11,
              ),
            ))
      ],
    );
  }
}
