import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salonman/core/widgets/component.dart';
import 'package:salonman/provider/book_proivder.dart';

import '../../../core/constants/color_utils.dart';
import '../book_widget.dart';
import '../dashboard_widget.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      init();
    });
  }

  Future<void> init() async {
    final provider = Provider.of<BookProvider>(context, listen: false);

    provider.generateDates();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Row(
            children: [
              Expanded(
                child: commonText(
                  text: "Book Service",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: commonBoxDecoration(
                  borderColor: colorChipBorderColor,
                  borderRadius: 32,
                ),

                child: commonText(
                  text: "Preferences",
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: colorChipBorderColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: colorBannerBg1,
          child: specialistsView(isShowToday: true),
        ),

        serviceSelectedView(),
        Divider(),

        DateSelector(),
      ],
    );
  }
}
