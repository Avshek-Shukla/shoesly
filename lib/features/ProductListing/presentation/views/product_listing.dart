import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoesly/core/utils/constants.dart';
import 'package:shoesly/features/ProductListing/domain/entities/product.dart';
import 'package:shoesly/features/ProductListing/presentation/bloc/products_list_bloc.dart';
import 'package:shoesly/features/ProductListing/presentation/views/cart.dart';
import 'package:shoesly/features/ProductListing/presentation/views/filter_items.dart';
import 'package:shoesly/features/ProductListing/presentation/views/product_description.dart';

class ProductListing extends StatefulWidget {
  const ProductListing({super.key});

  @override
  State<ProductListing> createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  List<Product> shoesData = [];
  @override
  void initState() {
    BlocProvider.of<ProductsListBloc>(context).add(GetProductListsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<ProductsListBloc, ProductsListState>(
        listener: (context, state) {
          if (state is GotProducts) {
            print(state.products);
            setState(() {
              shoesData = state.products;
            });
          } else if (state is GetProductListError) {
            print(state.message);
          }
        },
        child: shoesData.isNotEmpty
            ? Scaffold(
                backgroundColor: Colors.white,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        useSafeArea: true,
                        constraints: BoxConstraints.loose(
                          Size(
                            MediaQuery.of(context).size.width,
                            MediaQuery.of(context).size.height,
                          ),
                        ),
                        builder: (context) => const FilterItems());
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            FontAwesomeIcons.sliders,
                            size: 16,
                            color: Colors.white,
                          ),
                          Text(
                            "Filter",
                            style: CustomTextStyle.headLine300white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    appBar(context),
                    const SizedBox(
                      height: 15,
                    ),
                    productListsBuilder(context),
                  ],
                ),
              )
            : const Scaffold(
                body: Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
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
              Text(
                "Discover",
                style: CustomTextStyle.headLine700,
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
          )
        ],
      ),
    );
  }

  Widget productListsBuilder(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        color: Colors.black,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 4));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: shoesData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 18,
                crossAxisSpacing: 12,
                crossAxisCount: 2,
                mainAxisExtent: 224,
              ),
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => ProductDescription(
                          productIndex: index,
                          shoes: shoesData[index],
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: "product$index",
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                shoesData[index].name,
                                style: CustomTextStyle.bodyText100,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.solidStar,
                                    color: Color.fromRGBO(252, 210, 62, 1),
                                    size: 11,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    shoesData[index].ratings.toString(),
                                    style: CustomTextStyle.ratings,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    shoesData[index].reviews != null
                                        ? "(${shoesData[index].reviews!.length.toString()} Reviews)"
                                        : "(0 Reviews)",
                                    style: CustomTextStyle.bodyText10,
                                  ),
                                ],
                              ),
                              Text(
                                "\$${shoesData[index].price.toString()}",
                                style: CustomTextStyle.headLine300black,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
        ),
      ),
    );
  }
}
