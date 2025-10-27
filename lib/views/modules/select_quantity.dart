import 'package:flutter/material.dart';
import 'package:geography_geyser/core/app_spacing.dart';
import 'package:geography_geyser/core/app_strings.dart';
import 'package:geography_geyser/core/font_manager.dart';
import 'package:geography_geyser/custom_widgets/custom_q_quantity.dart';
import 'package:geography_geyser/views/custom_widgets/custom_login_button.dart';
import 'package:geography_geyser/views/modules/quiz_screen.dart';

class SelectQuantityScreen extends StatefulWidget {

  const SelectQuantityScreen({super.key,});

  @override
  State<SelectQuantityScreen> createState() => _SelectQuantityScreenState();
}

class _SelectQuantityScreenState extends State<SelectQuantityScreen> {
  int? selectedIndex;

  final List<int> quantityOptions = [10, 20, 30, 40, 50, 60, 70, 80];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.selectQuantity, style: FontManager.appBarText()),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppSpacing.h16,

                      /// Generate all quantity blocks
                      Column(
                        children: List.generate(quantityOptions.length, (
                          index,
                        ) {
                          final questions = quantityOptions[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Custom_Q_quantity(
                              question: questions,
                              isSelected: selectedIndex == index,
                              onPressed: () {
                                setState(() {
                                  if (selectedIndex == index) {
                                    // again select korle abar deselect(null) kore dibe
                                    selectedIndex = null;
                                  } else {
                                    // Select new index
                                    selectedIndex = index;
                                  }
                                });
                              },
                            ),
                          );
                        }),
                      ),

                      AppSpacing.h16,
                    ],
                  ),
                ),
              ),

              /// Button at the bottom
              CustomLoginButton(
                text: AppStrings.continueButton,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen(selectedIndex: selectedIndex,)),
                  );
                },
              ),
              AppSpacing.h12,
            ],
          ),
        ),
      ),
    );
  }
}
