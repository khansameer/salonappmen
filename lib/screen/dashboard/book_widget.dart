import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salonman/core/widgets/common_multi_select.dart';

import '../../core/constants/color_utils.dart';
import '../../core/widgets/component.dart';
import '../../provider/book_proivder.dart';

Widget serviceSelectedView() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    child: Column(
      children: [
        Row(
          children: [
            commonText(
              text: "Choose your service",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          color: Colors.white,
          child: Consumer<BookProvider>(
            builder: (context, provider, child) {
              return CommonMultiSelectWrap(
                items: provider.services,
                selectedItems: provider.selectedServices,
                onTap: (item) {
                  context.read<BookProvider>().toggleService(item);
                },
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget serviceDateSelectedView() {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: commonText(
              text: "Select Date",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          commonText(
            text: "Feb 2025",
            fontSize: 12,
            color: colorTextLight,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
      const SizedBox(height: 12),
      Container(
        height: 83,
        color: Colors.white,
        child: Consumer<BookProvider>(
          builder: (context, provider, child) {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  width: 60,
                  height: 83,
                  decoration: commonBoxDecoration(
                    color: colorChips,
                    borderRadius: 30,
                  ),
                );
              },
            );
          },
        ),
      ),
    ],
  );
}

class MonthHeader extends StatelessWidget {
  const MonthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookProvider>(
      builder: (context, provider, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            commonText(
              text: "Select Date",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left,color: colorTextLight,),
                  onPressed: () => provider.changeMonth(-1),
                ),
                commonText(
                  color: colorTextLight,
                  text:
                      "${_monthName(provider.currentMonth.month)} ${provider.currentMonth.year}",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right,color: colorTextLight,),
                  onPressed: () => provider.changeMonth(1),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  String _monthName(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return months[month - 1];
  }
}

class DateSelector extends StatefulWidget {
  const DateSelector({super.key});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<BookProvider>();
      final index = provider.todayIndex();
      if (index != -1) {
        _scrollController.animateTo(
          index * 90,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookProvider>(
      builder: (context, provider, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            children: [
              MonthHeader(),
              const SizedBox(height: 12),
              SizedBox(
                height: 83,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero  ,
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.dates.length,
                  itemBuilder: (context, index) {
                    final item = provider.dates[index];
                    final isSelected = provider.isSelected(item.date);
                    final isDisabled = item.isPast;

                    return GestureDetector(
                      onTap: isDisabled ? null : () => provider.selectDate(item.date),
                      child: Opacity(
                        opacity: isDisabled ? 0.4 : 1,
                        child: Container(
                          width: 63,
                          height: 83,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: commonBoxDecoration(
                            color: isSelected
                                ? colorChipBorderColor
                                :colorChips,
                            borderColor: isSelected
                                ? colorChips
                                :colorChipBorderColor,
                            borderRadius: 32,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              commonText(
                                text: item.day,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: isSelected ? Colors.white : colorTextChips,
                              ),
                              const SizedBox(height: 6),
                              commonText(
                               text:  item.dayNumber,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : colorTextChips,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
