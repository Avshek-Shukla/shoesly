import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoesly/core/utils/bottom_bar.dart';
import 'package:shoesly/core/utils/constants.dart';
import 'package:shoesly/core/utils/input_field.dart';
import 'package:shoesly/features/ProductListing/presentation/views/cart.dart';

class AddToCart extends StatefulWidget {
  final double? productPrice;
  const AddToCart({super.key, required this.productPrice});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final TextEditingController _quantityController =
      TextEditingController(text: "1");

  @override
  void initState() {
    super.initState();
    _quantityController.addListener(_calculate);
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  void _calculate() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: IntrinsicHeight(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Add to cart",
                    style: CustomTextStyle.headLine600,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.zero,
                    iconSize: 24,
                    splashRadius: 30,
                    icon: const Icon(FontAwesomeIcons.xmark),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quantity",
                      style: CustomTextStyle.headLine400,
                    ),
                    InputField(
                      "1",
                      _quantityController,
                      TextInputType.number,
                    )
                  ],
                ),
              ),
            ),
            bottomBar(
              context,
              title: "Total Price",
              price:
                  "\$${double.parse(_quantityController.text) * widget.productPrice!}",
              buttonName: "Add to Cart",
              onButtonClick: () {
                Navigator.pop(context);
                showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    // showDragHandle: true,
                    isScrollControlled: true,
                    builder: (context) {
                      return addedToCart(context);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget addedToCart(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 60,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Added to cart",
                    style: CustomTextStyle.headLine700,
                  ),
                  Text(
                    "${_quantityController.text} Item Total",
                    style: CustomTextStyle.bodyText200,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 90,
            alignment: Alignment.center,
            color: Colors.white,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: CustomColors.grey,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        "Back Explore",
                        style: CustomTextStyle.headLine300black,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (builder) => const Cart()),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        "To Cart",
                        style: CustomTextStyle.headLine300white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
