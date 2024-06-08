import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoesly/core/utils/constants.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterItems extends StatefulWidget {
  const FilterItems({super.key});

  @override
  State<FilterItems> createState() => _FilterItemsState();
}

class _FilterItemsState extends State<FilterItems> {
  List<String> sortbyitems = [
    "Most recent",
    "Highest price",
    "Lowest price",
    "Highest rating",
    "Most sold",
  ];
  List<bool> issortbyitemSelected = [
    false,
    false,
    false,
    false,
    false,
  ];
  List<String> gender = [
    "Man",
    "Woman",
    "Unisex",
  ];
  List<bool> isgenderSelected = [
    false,
    false,
    false,
  ];
  List<Map> colorsData = [
    {"colorName": "Black", "isSelected": false, "color": Colors.black},
    {"colorName": "Red", "isSelected": false, "color": Colors.red},
    {"colorName": "White", "isSelected": false, "color": Colors.white},
  ];
  SfRangeValues _sliderValue = const SfRangeValues(0, 1750);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Filter",
          style: CustomTextStyle.headLine400,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                brandsSection(context),
                priceRangeSection(context),
                sortBySection(context),
                genderSection(context),
                colorSection(context)
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: CustomColors.grey),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          "Reset(4)",
                          style: CustomTextStyle.headLine300black,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        "Apply",
                        style: CustomTextStyle.headLine300white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget brandsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Brands",
          style: CustomTextStyle.headLine400,
        ),
        SizedBox(
          height: 170,
          child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 25, bottom: 20, left: 10, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Stack(
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundColor: CustomColors.grey,
                          ),
                          Positioned(
                            top: 38,
                            left: 38,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.black,
                              child: Icon(
                                FontAwesomeIcons.check,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "NIKE",
                        style: CustomTextStyle.headLine300black,
                      ),
                      Text(
                        "1001 items",
                        style: CustomTextStyle.bodyText10,
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget priceRangeSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Price Range",
          style: CustomTextStyle.headLine400,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 30),
          child: SfRangeSlider(
            min: 0.0,
            max: 1750.0,
            values: _sliderValue,
            stepSize: 20,
            activeColor: Colors.black,
            interval: 250,
            showTicks: true,
            showLabels: true,
            enableTooltip: true,
            minorTicksPerInterval: 1,
            onChanged: (SfRangeValues values) {
              setState(() {
                _sliderValue = values;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget sortBySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sort By",
          style: CustomTextStyle.headLine400,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: SizedBox(
            height: 50,
            child: ListView.builder(
                itemCount: sortbyitems.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        try {
                          issortbyitemSelected[
                              issortbyitemSelected.indexOf(true)] = false;
                        } catch (exception) {}

                        issortbyitemSelected[index] =
                            !issortbyitemSelected[index];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: issortbyitemSelected[index]
                                ? Colors.black
                                : CustomColors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: issortbyitemSelected[index]
                              ? Colors.black
                              : Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          sortbyitems[index],
                          style: GoogleFonts.urbanist(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: issortbyitemSelected[index]
                                ? Colors.white
                                : Colors.black,
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

  Widget genderSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: CustomTextStyle.headLine400,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: SizedBox(
            height: 50,
            child: ListView.builder(
                itemCount: gender.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        try {
                          isgenderSelected[isgenderSelected.indexOf(true)] =
                              false;
                        } catch (exception) {}

                        isgenderSelected[index] = !isgenderSelected[index];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: isgenderSelected[index]
                                ? Colors.black
                                : CustomColors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: isgenderSelected[index]
                              ? Colors.black
                              : Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          gender[index],
                          style: GoogleFonts.urbanist(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isgenderSelected[index]
                                ? Colors.white
                                : Colors.black,
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

  Widget colorSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: CustomTextStyle.headLine400,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: SizedBox(
            height: 50,
            child: ListView.builder(
                itemCount: colorsData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        try {
                          for (var e in colorsData) {
                            e['isSelected'] = false;
                          }
                        } catch (exception) {}

                        colorsData[index]['isSelected'] =
                            !colorsData[index]['isSelected'];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: colorsData[index]['isSelected']
                                ? Colors.black
                                : CustomColors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 26,
                              width: 26,
                              decoration: BoxDecoration(
                                color: colorsData[index]['color'],
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: CustomColors.grey,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              colorsData[index]['colorName'],
                              style: GoogleFonts.urbanist(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
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
}
