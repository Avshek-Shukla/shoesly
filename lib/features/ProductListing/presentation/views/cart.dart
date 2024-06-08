import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoesly/core/utils/bottom_bar.dart';
import 'package:shoesly/core/utils/constants.dart';
import 'package:shoesly/features/ProductListing/presentation/views/checkout.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List cartItems = [1, 2, 3];
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 15),
            iconSize: 20,
            splashRadius: 30,
            icon: const Icon(FontAwesomeIcons.arrowLeftLong),
          ),
          title: Text(
            "Cart",
            style: CustomTextStyle.headLine400,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          height: 88,
                          width: 88,
                          decoration: BoxDecoration(
                            color: CustomColors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jordan 1 Retro High",
                                style: CustomTextStyle.headLine400,
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(
                                "Nike  Red Grey  40",
                                style: CustomTextStyle.bodyText100,
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$235",
                                    style: CustomTextStyle.headLine300black,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 23,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: quantity > 1
                                                ? Colors.black
                                                : Colors.grey,
                                            width: 1.5,
                                          ),
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          highlightColor: Colors.transparent,
                                          padding: EdgeInsets.zero,
                                          // constraints: BoxConstraints(),
                                          iconSize: 15,
                                          splashRadius: 2,
                                          color: quantity > 1
                                              ? Colors.black
                                              : Colors.grey,
                                          icon: const Icon(
                                              FontAwesomeIcons.minus),
                                          onPressed: () {},
                                        ),
                                      ),
                                      Text(
                                        quantity.toString(),
                                        style: CustomTextStyle.headLine300black,
                                      ),
                                      Container(
                                        height: 23,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1.5),
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          iconSize: 15,
                                          highlightColor: Colors.transparent,
                                          color: Colors.black,
                                          icon:
                                              const Icon(FontAwesomeIcons.plus),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            bottomBar(
              context,
              title: "Grand Total",
              price: "\$200",
              buttonName: "CHECK OUT",
              onButtonClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => const Checkout()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
