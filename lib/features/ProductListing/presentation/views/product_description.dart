import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoesly/core/utils/constants.dart';
import 'package:shoesly/features/ProductListing/domain/entities/product.dart';
import 'package:shoesly/features/ProductListing/presentation/views/add_to_cart.dart';
import 'package:shoesly/features/ProductListing/presentation/views/cart.dart';

class ProductDescription extends StatefulWidget {
  final int productIndex;
  final Product shoes;
  const ProductDescription(
      {super.key, required this.productIndex, required this.shoes});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  late final int _imgIndex = 0;
  final int _numberofImages = 3;
  List<String> sizes = [
    "39",
    "40",
    "41",
    "42",
    "43",
  ];
  List<bool> isSizeSelected = [
    true,
    false,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(context),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      itemCaraousel(context),
                      const SizedBox(
                        height: 30,
                      ),
                      productName(context),
                      const SizedBox(
                        height: 30,
                      ),
                      sizeSection(context),
                      const SizedBox(
                        height: 30,
                      ),
                      descriptionSection(context),
                      const SizedBox(
                        height: 30,
                      ),
                      reviewSection(context),
                    ],
                  ),
                ),
              ),
            ),
            bottomBar(context),
          ],
        ),
      ),
    );
  }

  Widget bottomBar(BuildContext context) {
    return Container(
      height: 90,
      alignment: Alignment.center,
      color: Colors.white,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Price",
                  style: CustomTextStyle.bodyText100,
                ),
                Text(
                  "\$${widget.shoes.price.toString()}",
                  style: CustomTextStyle.headLine600,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    showDragHandle: true,
                    isScrollControlled: true,
                    builder: (context) {
                      return AddToCart(
                        productPrice: widget.shoes.price,
                      );
                    });
              },
              child: Container(
                height: 50,
                width: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100)),
                child: Text(
                  "Add to Cart",
                  style: CustomTextStyle.headLine300white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productName(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.shoes.name.toString(),
          style: CustomTextStyle.headLine600,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ratingBuilder(context, rating: widget.shoes.ratings!),
            const SizedBox(
              width: 2,
            ),
            Text(
              "4.5",
              style: CustomTextStyle.ratings,
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              widget.shoes.reviews != null
                  ? "(${widget.shoes.reviews!.length.toString()} Reviews)"
                  : "(0 Reviews)",
              style: CustomTextStyle.bodyText10,
            ),
          ],
        ),
      ],
    );
  }

  Widget sizeSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          style: CustomTextStyle.headLine400,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            height: 50,
            child: ListView.builder(
                itemCount: sizes.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        try {
                          isSizeSelected[isSizeSelected.indexOf(true)] = false;
                        } catch (exception) {}

                        isSizeSelected[index] = !isSizeSelected[index];
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 40,
                        margin: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.5,
                              color: isSizeSelected[index]
                                  ? Colors.black
                                  : CustomColors.grey,
                            ),
                            borderRadius: BorderRadius.circular(100),
                            color: isSizeSelected[index]
                                ? Colors.black
                                : Colors.transparent),
                        child: Text(
                          sizes[index],
                          style: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isSizeSelected[index]
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }

  Widget descriptionSection(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: CustomTextStyle.headLine400,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              widget.shoes.description.toString(),
              style: CustomTextStyle.bodyText200,
            ),
          )
        ],
      ),
    );
  }

  Widget reviewSection(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Review (${widget.shoes.reviews!.length})",
          style: CustomTextStyle.headLine400,
        ),
        widget.shoes.reviews!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                    itemCount: widget.shoes.reviews!.length >= 3
                        ? 3
                        : widget.shoes.reviews!.length,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.black,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          widget
                                              .shoes.reviews![index]['username']
                                              .toString(),
                                          style:
                                              CustomTextStyle.headLine300black,
                                        ),
                                        const Expanded(child: SizedBox()),
                                        Text(
                                          "Today",
                                          style: CustomTextStyle.bodyText100,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    ratingBuilder(context,
                                        rating: (widget.shoes.reviews![index]
                                                ['rating'])
                                            .toDouble()),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        widget.shoes.reviews![index]['review']
                                            .toString(),
                                        style: CustomTextStyle.bodyText100,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ));
                    }),
              )
            : const SizedBox(),
        widget.shoes.reviews!.length >= 3
            ? GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: CustomColors.grey,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    "SEE ALL REVIEW",
                    style: CustomTextStyle.headLine300black,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget itemCaraousel(BuildContext context) {
    return Hero(
      tag: "product${widget.productIndex}",
      child: Container(
        height: 315,
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomColors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 40,
                width: 132,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border:
                            Border.all(color: CustomColors.grey, width: 1.5),
                      ),
                    ),
                    Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Row(
                  children: List.generate(
                    _numberofImages,
                    (index) => Builder(
                        builder: (context) => Padding(
                              padding: const EdgeInsets.all(5),
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: _imgIndex == index
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  alignment: Alignment.centerLeft,
                  iconSize: 20,
                  splashRadius: 30,
                  icon: const Icon(FontAwesomeIcons.arrowLeftLong),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24,
            width: 24,
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (builder) => const Cart()),
                    );
                  },
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                  splashRadius: 30,
                  icon: const Icon(FontAwesomeIcons.bagShopping),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 7,
                        width: 7,
                        color: CustomColors.error,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget ratingBuilder(BuildContext context, {required double rating}) {
  return Row(
    children: List.generate(
      5,
      (index) => Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5, right: 8),
          child: Icon(
            FontAwesomeIcons.solidStar,
            color: rating > index
                ? const Color.fromRGBO(252, 210, 62, 1)
                : CustomColors.grey,
            size: 12,
          ),
        ),
      ),
    ),
  );
}
