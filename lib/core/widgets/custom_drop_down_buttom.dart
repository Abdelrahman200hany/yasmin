// from drop down buttom2 Package version 2 as v 3 not perfect

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:yasmin/core/utils/app_colors.dart';
import 'package:yasmin/core/utils/app_styles.dart';

class CustomDropDownButtom extends StatefulWidget {
  const CustomDropDownButtom({
    super.key,
    required this.hint,
    required this.itemsList,
    required this.onSaved,
  });
  final String hint;
  final List<String> itemsList;
  final ValueChanged<String> onSaved;

  @override
  State<CustomDropDownButtom> createState() => _CustomDropDownButtomState();
}

class _CustomDropDownButtomState extends State<CustomDropDownButtom> {
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      // valueListenable: selectedCity,
      value: selectedCity,
      hint: Text(widget.hint, style: AppStyle.styleSRegular16(context)),
      items: widget.itemsList.map((city) {
        return DropdownMenuItem<String>(
          value: city,
          child: Text(city, style: AppStyle.styleSRegular16(context)),
        );
      }).toList(),

      // تحديث الاختيار فورًا
      onChanged: (value) {
        setState(() {
          selectedCity = value;
          widget.onSaved(value!);
        });
      },

      // التحقق من صحة الاختيار
      validator: (value) {
        if (value == null || value.isEmpty) return "من فضلك اختر المحافظة";
        return null;
      },
      // to change munu decoration
      dropdownStyleData: DropdownStyleData(
        maxHeight: 300,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF9FAFA),
        ),
      ),

      // تصميم الـ input field
      decoration: InputDecoration(
        fillColor: const Color(0xffF9FAFA),
        filled: true,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder().copyWith(
          borderSide: BorderSide(width: 1, color: AppColor.kPrimaryColor),
        ),
      ),

      alignment: Alignment.centerRight,
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 1, color: const Color(0xFFE6E9E9)),
    );
  }
}
