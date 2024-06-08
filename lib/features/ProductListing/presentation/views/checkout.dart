import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoesly/core/utils/bottom_bar.dart';
import 'package:shoesly/core/utils/constants.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
            "Order Summary",
            style: CustomTextStyle.headLine400,
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Information",
                        style: CustomTextStyle.headLine500,
                      ),
                      ListTile(
                        title: Text(
                          "Payment Method",
                          style: CustomTextStyle.headLine300black,
                        ),
                        minVerticalPadding: 10,
                        subtitle: const Text("Credit Card"),
                        onTap: () {},
                        contentPadding: EdgeInsets.zero,
                        trailing: const Icon(
                          FontAwesomeIcons.greaterThan,
                          color: Colors.grey,
                          size: 12,
                        ),
                        subtitleTextStyle: CustomTextStyle.bodyText200,
                      ),
                      ListTile(
                        minVerticalPadding: 10,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          "Location",
                          style: CustomTextStyle.headLine300black,
                        ),
                        subtitle: const Text("Semarang, Indonesia"),
                        onTap: () {},
                        trailing: const Icon(
                          FontAwesomeIcons.greaterThan,
                          color: Colors.grey,
                          size: 12,
                        ),
                        subtitleTextStyle: CustomTextStyle.bodyText200,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Order Detail",
                        style: CustomTextStyle.headLine500,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Nike , Red Grey , 40 , Qty 1",
                                      style: CustomTextStyle.bodyText100,
                                    ),
                                    Text(
                                      "\$235",
                                      style: CustomTextStyle.headLine300black,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Payment Detail",
                        style: CustomTextStyle.headLine500,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sub Total",
                            style: CustomTextStyle.bodyText200,
                          ),
                          Text(
                            "\$705",
                            style: CustomTextStyle.headLine400,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shipping",
                            style: CustomTextStyle.bodyText200,
                          ),
                          Text(
                            "\$20",
                            style: CustomTextStyle.headLine400,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Order",
                            style: CustomTextStyle.bodyText200,
                          ),
                          Text(
                            "\$725",
                            style: CustomTextStyle.headLine500,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomBar(
              context,
              title: "Grand Total",
              price: "\$735",
              buttonName: "PAYMENT",
              onButtonClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}
